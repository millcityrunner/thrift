namespace js players
namespace py millcityrunnerthrift.players

include "common.thrift"

// typedefs

// enums
enum PlayerStatus {
    ACTIVE = 1,
    RETIRED = 2,
    FREE_AGENT = 3,
    SUSPENDED = 4,
}

// structs
struct Player {
    1: optional common.PlayerId id;
    2: optional common.Date start_date;
    3: optional common.Date end_date;
    4: optional common.Timestamp create_ts;
    5: optional common.Timestamp updated_ts;
    6: optional PlayerStatus status;
    7: optional i64 age;
    8: optional i64 height_inches;
    9: optional i64 weight_pounds;
    10: optional common.Gender gender;
    11: optional common.Positions primary_position;
    12: optional common.Positions secondary_position;
    13: optional common.Positions third_position;
    // do we add a depth chart thrift file?
    // use case: CB1 vs. CB3 vs. Bench Player
}

struct PlayerResponse {
    1: optional list<Player> players;
}


service PlayerService {
    PlayerResponse get_players();
}