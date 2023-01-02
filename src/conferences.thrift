namespace js conferences
namespace py millcityrunnerthrift.conferences

include "common.thrift"
include "seasons.thrift"

// typedefs

// enums
enum ConferenceStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    TERMINATED = 3,
}

// structs
struct Conference {
    1: optional common.ConferenceId id;
    2: optional string name;
    3: optional ConferenceStatus status;
    4: optional list<common.Year> years_active;
    5: optional common.SeasonId season_id;
    6: optional common.Timestamp created_ts;
    7: optional common.Timestamp updated_ts;
}

service HelloWorldService {
    HelloWorldResponse get_hello_world();
}
