namespace js sports
namespace py millcityrunnerthrift.sports

include "common.thrift"

// typedefs

// enums
enum SportStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    NOT_STARTED = 3,
    ON_STRIKE = 4
}

// structs
struct Sport {
    1: optional common.SportId id;
    2: optional string name;
    3: optional SportStatus status;
    4: optional common.Date start_date;
    5: optional common.Date end_date;
    6: optional common.Timestamp created_ts;
    7: optional common.Timestamp updated_ts;
}

struct SportResponse {
    1: optional list<Sport> sports;
}


service SportService {
    SportResponse get_sports();
}