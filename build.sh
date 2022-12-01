#!/bin/sh

# Use this if you just want to get thrift compiled *without* installing any
# Python dependencies. This is useful if you're actually in a Python repository
# that depends on thrift, and you want to manage all your Python dependences
# yourself. It's problematic if you try to compile thrift and then the set of
# installed Python dependences changes.
# If you want Python dependences (or don't mind them), just use `make`
# directly.
#
# Example usage:
#
# build.sh
# build.sh clean
# build.sh THRIFT_VERSION=thrift

export SUPPRESS_DEFAULT_THRIFT_VERSION=1
root="$(dirname "$0")"
make -C "$root" "$@" # Pass specified args (if any) to make
