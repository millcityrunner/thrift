namespace js injury_reports
namespace py millcityrunnerthrift.injury_reports

include "common.thrift"

// typedefs

// enums
enum InjuryReportStatus {
    ACTIVE = 1,
    EXPIRED = 2,
    REMOVED = 3,
    MISINFORMATION = 4,
}

enum InjurySeverity {
    GAME_TIME_DECISION = 1,
    QUESTIONABLE = 2,
    DOUBTFUL = 3,
    OUT = 4,
    INJURY_RESERVE = 5,
    DONE_FOR_SEASON = 6,
    INDEFINITE = 7,
}

// structs
