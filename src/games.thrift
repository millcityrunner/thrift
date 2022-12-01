namespace js games
namespace py millcityrunnerthrift.games

include "common.thrift"

// typedefs

// enums
enum GameStatus {
    IN_PROGRESS = 1,
    UPCOMING = 2,
    FINISHED = 3,
    DELAYED = 4,
    POSTPONED = 5,
    CANCELED = 6,
}

// structs
struct Game {
    1: optional common.GameId id;
    2: optional common.Date start_date;
    3: optional common.Date end_date;
    4: optional common.Timestamp created_ts;
    5: optional common.Timestamp updated_ts;
    6: optional common.TeamId away_team_id;
    7: optional common.TeamId home_team_id;
    8: optional i64 winner_score;
    9: optional i64 loser_score;
    10: optional GameStatus status;
}