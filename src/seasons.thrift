namespace js seasons
namespace py millcityrunnerthrift.seasons

include "common.thrift"

// typedefs

// enums
enum SeasonStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    NOT_STARTED = 3,
    CANCELED = 4,
}

// structs
struct Season {
    1: optional common.SeasonId id;
    2: optional common.Date start_date;
    3: optional common.Date end_date;
    4: optional SeasonStatus status;
    5: optional common.Timestamp created_ts;
    6: optional common.Timestamp updated_ts;
}
