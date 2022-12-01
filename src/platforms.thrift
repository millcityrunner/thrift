namespace js platforms
namespace py millcityrunnerthrift.platforms

include "common.thrift"

// typedefs

// enums
enum PlatformStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    ON_HOLD = 3,
}

enum PlatformTypes {
    FANDUEL = 1,
    DRAFTKINGS = 2,
    FANDUEL_SPORTSBOOK = 3,
    UNDERDOG = 4,
    MONKEY_KNIFE_FIGHT = 5,
    BET_MGM = 6,
    CAESARS = 7,
}

// structs
struct Platform {
    1: optional common.PlatformId id;
    2: optional PlatformTypes type;
    3: optional PlatformStatus status;
    4: optional common.Timestamp created_ts;
    5: optional common.Timestamp updated_ts;
}