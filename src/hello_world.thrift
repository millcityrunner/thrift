struct HelloWorldResponse {}

service HelloWorldService {
    HelloWorldResponse hello_world() throws (
        1: common.InvalidRequest invalid_request,
    );