namespace js conferences
namespace py millcityrunnerthrift.conferences

include "common.thrift"
include "seasons.thrift"

// typedefs

// structs
struct Conference {
    1: optional common.ConferenceId id;
    2: optional string name;
    3: optional bool is_active;
    4: optional common.SeasonId season_id;
    5: optional common.Timestamp created_ts;
    6: optional common.Timestamp updated_ts;
}

struct ConferenceResponse {
    1: optional list<Conference> conferences;
}

service ConferenceService {
    ConferenceResponse get_conferences();
}
