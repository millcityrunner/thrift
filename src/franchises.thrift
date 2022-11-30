namespace js franchises
namespace py millcityrunnerthrift.franchises

include "common.thrift"

// typedefs

// enums
enum FranchiseStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    TERMINATED = 3,
    FOLDED = 4,
    BANKRUPT = 5,
    BOUGHT_OUT = 6
}

// structs
struct Tenure {
    1: optional common.Year start_year;
    2: optional common.Year end_year;
}

struct Franchise {
    1: optional common.FranchiseId id;
    2: optional common.Timestamp established_date;
    3: optional common.TeamId root_team_id;
    4: optional map<common.TeamId, Tenure> lineage;
    5: optional common.Timestamp created_ts;
    6: optional common.Timestamp updated_ts;
    7: optional common.SportId sport_id;
}
