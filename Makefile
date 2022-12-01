.DEFAULT_GOAL := out

# The expected version of thrift.
# This is compared against the output of `thrift --version` as a sanity check
# that the user actually has the expected version of thrift installed, and also
# affects some of our configuration settings when invoking thrift itself.
# Note: this comparison supports globs. This is useful for when you're
# interested in a particular base version of thrift, but don't care about the
# "sub" version.
# For example:
#
#    $ thrift --version
#    Thrift version 0.12.1-millcityrunner2
#    Commit: aa58ea81
#
# 0.12.1 is the "base" version of thrift, and "millcityrunner2" is an millcityrunner specific
# identifier to help us distinguish between the various versions of 0.12.1 that we've
# had.
# In this scenario, a user might specify `EXPECTED_THRIFT_VERSION=0.12.1-*` to indicate
# that they're interested in any version of thrift 0.12.1. If they're
# particular about the version, they could instead specify
# `EXPECTED_THRIFT_VERSION=0.12.1-millcityrunner2`.
#
# Note: This has a default just so developers working directly in the thrift
# repo don't have to remember to set this environment variable, but every top
# level project that uses thrift should use our build.sh script and that script
# requires you to explicitly specify a value for `EXPECTED_THRIFT_VERSION`.
EXPECTED_THRIFT_VERSION ?= $(if $(SUPPRESS_DEFAULT_THRIFT_VERSION),,0.17.0)

actual_thrift_version = $(shell thrift --version | grep "Thrift version" | sed -E "s/Thrift version (.*)/\1/")
thrift_files = $(shell find src -type f -name *.thrift)
thrift_dirs = $(shell find src -type d)

# The java:hashcode option was removed in https://issues.apache.org/jira/browse/THRIFT-2263.
# It now defaults to on, so it should be safe to just not pass that option
# with newer versions of thrift.
java_bindings = java:private-members,android,fullcamel
python_bindings = py:slots
js_bindings = js:node,ts

bindings = \
	$(java_bindings) \
	$(python_bindings) \
	$(js_bindings) \
	cocoa

.PHONY: bootstrap
bootstrap: .bootstrapped-asdf .bootstrapped-python

.PHONY: python-package
python-package: bootstrap out
	poetry build

# output target is the out directory.  It gets a new timestamp when everything
# is rebuilt, so just rebuild if any thrift files or directories have changed.
# Directories will change if a file is removed.
.SILENT: out
out: $(thrift_files) $(thrift_dirs) Makefile
	if [ -z "$(EXPECTED_THRIFT_VERSION)" ]; then \
		echo "Error: EXPECTED_THRIFT_VERSION is not set"; \
		exit 1; \
	fi
	# Note that the bizzareness with quotation marks here is intentional:
	# EXPECTED_THRIFT_VERSION is allowed to have a glob it in, and we need to not quote
	# it for glob-style comparison to apply.

	printf "Building thrift\n"
	# Clean up any prev leftovers of tmp_out in case a past build failed
	rm -rf tmp_out
	mkdir tmp_out
	for file in $(thrift_files); \
	do \
		printf "."; \
		for binding in $(bindings); \
		do \
			generator=$${binding%%:*}; \
			matches=`grep -m 1 "namespace $$generator " $$file`; \
			if [ -n "$${matches}" ]; then \
				thrift --allow-64bit-consts --gen $$binding -o tmp_out $$file || { printf "\nFailed building $$binding for $$file\n";  rm -rf out tmp_out ; exit 1; } ; \
			fi \
		done; \
	done
	printf "\nCompilation finished.\n"
	if [ -d "out" ]; \
		then printf "Removing prev 'out' dir.\n"; \
		mv out out_remove_me; \
	fi
	printf "Installing built files...\n"
	mv tmp_out out
	cp package.json out/gen-nodejs
	printf "Cleaning up...\n"
	rm -rf out_remove_me
	printf "Done\n"

.PHONY: clean
clean:
	rm -rf out_remove_me
	# Kept here to clean up legacy cruft. Remove after 2/1/2023.
	rm -rf tmp_for_compilation
	rm -rf tmp_out
	rm -rf out*
	rm -rf dist
	rm -f .bootstrapped-*

.SILENT: test
.PHONY: test
test: bootstrap out
	# Check for void methods. Allow `oneway void`, which are used for async requests.
	# This regex is okay because `oneway` is the only keyword allowed before the return
	# type (as far as we know).
	printf "Checking for methods with void return\n"
	matches=$$(egrep --line-number '^\W*void ' $(thrift_files)); \
	if [ -n "$${matches}" ]; then \
		printf "\nERROR: Methods must have a return value.\n" 1>&2; \
		printf "You can use common.Response if you don't need to return anything.\n" 1>&2; \
		printf "$${matches}\n\n" 1>&2; \
		exit 1; \
	fi

	# Check for trailing whitespace.
	printf "Checking for trailing whitespace\n"
	matches=$$(grep -r --line-number '[[:blank:]]$$' $(thrift_files)); \
	if [ -n "$${matches}" ]; then \
		printf "\nERROR: Trailing whitespace is not allowed.\n" 1>&2; \
		printf "$${matches}\n\n" 1>&2; \
		exit 1; \
	fi

	# Check for fields named "description" (not allowed on iOS).
	# This check only applies to files used on mobile (so not admin.thrift).
	printf "Checking that there are no fields named \"description\"\n"
	matches=$$(egrep -H --line-number --color "\d+: optional \w+ description;" src/auth/auth_external.thrift src/careprovider.thrift src/clientevents.thrift src/common.thrift src/owner.thrift src/sessionservice.thrift); \
	if [ -n "$${matches}" ]; then \
		printf "\nERROR: Fields named 'description' are not allowed due to name collision with iOS NSObject's description field.\n" 1>&2; \
		printf "$${matches}\n\n" 1>&2; \
		exit 1; \
	fi

	# Make sure generated python is importable. Depending on order of
	# messages in thrift files, the generated python may be invalid.
	printf "Checking that generated python can be imported\n"
	PYTHONPATH=out/gen-py python -c "`find out/gen-py -mindepth 2 -name *.py | sed 's/^out\/gen-py\///' | sed 's/\.py$$//' | sed 's/\/__init__$$//' | sed 's/\//./g' | sed 's/^/import /'`" || { printf "\nERROR: Failed to import generated python for $$module\n"; exit 1; }

ifeq ($(SKIP_BOOTSTRAPPING), 1)
.bootstrapped-asdf:
.bootstrapped-python:
else
.bootstrapped-asdf: .tool-versions
	asdf install
	touch .bootstrapped-asdf

.bootstrapped-python: poetry.lock
	# Note: we're specifying `--no-root` here because the root package can't be
	# installed until thrift compilation is done.
	poetry install --sync --no-root
	touch .bootstrapped-python

poetry.lock: pyproject.toml
	poetry lock --no-update
	touch poetry.lock
endif
