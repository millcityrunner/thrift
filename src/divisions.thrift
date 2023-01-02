namespace js divisions
namespace py millcityrunnerthrift.divisions

include "common.thrift"
include "conferences.thrift"

// typedefs

// enums
enum DivisionStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    TERMINATED = 3,
}

// structs
struct Division {
    1: optional common.DivisionId id;
    2: optional string name;
    3: optional DivisionStatus status;
    4: optional list<common.Year> years_active;
    5: optional common.ConferenceId conference_id;
}

struct DivisionResponse {
    1: optional list<Division> divisions;
}

service DivisionService {
    DivisionResponse get_divisions();
}