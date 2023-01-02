namespace js lineups
namespace py millcityrunnerthrift.lineups

include "common.thrift"

// typedefs

// enums
enum LineupStatus {
    COMPLETE = 1,
    EDITING = 2,
    INCOMPLETE = 3,
    SALARY_EXCEEDED = 4,
    MAX_PLAYER_TEAM_EXCEEDED = 5, // ex. more than 4 players on the same team
}

// structs
struct Lineup {
    1: optional common.LineupId id;
    2: optional LineupStatus status;
    3: optional common.PlatformId platform_id;
    4: optional common.Timestamp created_ts;
    5: optional common.Timestamp updated_ts;
}

struct LineupResponse {
    1: optional list<Lineup> lineups;
}

service LineupService {
    LineupResponse get_lineups();
}