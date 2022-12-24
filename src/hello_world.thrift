namespace js seasons
namespace py millcityrunnerthrift.seasons

include "common.thrift"

struct HelloWorldResponse {}

service HelloWorldService {
    HelloWorldResponse hello_world() throws (
        1: common.InvalidRequest invalid_request,
    );
}