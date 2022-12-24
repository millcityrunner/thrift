namespace js hello_world
namespace py millcityrunnerthrift.hello_world

include "common.thrift"

struct HelloWorldResponse {}

service HelloWorldService {
    HelloWorldResponse hello_world() throws (
        1: common.InvalidRequest invalid_request,
    );
}