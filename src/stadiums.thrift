namespace js stadiums
namespace py millcityrunnerthrift.stadiums

include "common.thrift"
include "teams.thrift"

// typedefs

typedef common.Uuid StadiumId;
typedef common.Uuid LocationId;

// enums

enum StadiumStatus {
    ACTIVE = 1,
    RETIRED = 2,
    CLOSED = 3,
}

enum FieldMaterial {
    TURF = 1,
    SOD = 2,
    SOIL = 3,
    MIXED = 4,
    CLAY = 5,
}

enum RoofType {
    OPEN = 1,
    CLOSED = 2,
    RETRACTABLE = 3,
}

// structs

struct Stadium {
    1: optional StadiumId id;
    2: optional LocationId location_id;
    3: optional i64 status;
    4: optional i64 capacity;
    5: optional common.Timestamp created_ts;
    6: optional string name;
    7: optional bool is_dome;
    8: optional i64 roof_type;
    9: optional i64 field_material;
    10: optional common.Timestamp activation_ts;
    11: optional common.Timestamp deactivation_ts;
    12: optional list<common.TeamId> team_ids;
    13: optional common.TeamId current_active_team_id;
}