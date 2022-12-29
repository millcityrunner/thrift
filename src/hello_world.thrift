namespace js hello_world
namespace py millcityrunnerthrift.hello_world

include "common.thrift"

struct HelloWorldResponse {
    1: optional string hello;
}

service HelloWorldService {
    HelloWorldResponse get_hello_world();
}