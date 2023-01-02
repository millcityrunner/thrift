namespace js contests
namespace py millcityrunnerthrift.contests

include "common.thrift"

// typedefs

// enums
enum ContestStatus {
    ACTIVE = 1,
    UPCOMING = 2,
    CANCELED = 3,
    FULL = 4,
    FINISHED = 5,
}

enum FanDuelContestType {
    TOURNAMENT = 1,
    FIFTY_FIFTY = 2,
    HEAD_TO_HEAD = 3,
    MULTIPLIER = 4,
    BEAT_THE_SCORE = 5,
    BEGINNERS_ONLY = 6,
    FRIENDS_MODE = 7,
    THREE_TO_ONE_HUNDRED_PLAYERS = 8,
    SATELLITES_AND_QUALIFIERS = 9,
    SINGLE_GAME = 10,
    DAILY_SNAKE_DRAFT = 11,
    BEST_BALL = 12
}

enum FanDuelEntryType {
    SINGLE_ENTRY = 1,
    MULTIENTRY = 2,
    CAPPED = 3, // ex. Max 3 Entries allowed
}

service HelloWorldService {
    HelloWorldResponse get_hello_world();
}