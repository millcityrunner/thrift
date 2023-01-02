namespace js teams
namespace py millcityrunnerthrift.teams

include "common.thrift"
include "divisions.thrift"

// typedefs

// enums
enum TeamStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    TERMINATED = 3,
    RELOCATED = 4,
}

// structs
struct Team {
    1: optional common.TeamId id;
    2: optional string city;
    3: optional string mascot;
    4: optional common.Timestamp created_ts;
    5: optional common.Timestamp updated_ts;
    6: optional common.Timestamp established_date;
    7: optional TeamStatus status;
    8: optional common.DivisionId division_id;
    9: optional common.FranchiseId franchise_id;
}

struct TeamResponse {
    1: optional list<Team> teams;
}


service TeamService {
    TeamResponse get_teams();
}