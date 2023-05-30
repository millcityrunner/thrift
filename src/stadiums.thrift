namespace js stadiums
namespace py millcityrunnerthrift.stadiums

include "common.thrift"
include "teams.thrift"

// typedefs

// enums

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

enum GrassType {
    PERENNIAL_RYEGRASS = 1,
    KENTUCKY_BLUEGRASS = 2,
    TALL_FESCUE = 3,
    POLYETHYLENE_TURF = 4,
    NYLON_TURF = 5,
    POLYPROPYLENE_TURF = 6,
}

enum Direction {
    NORTH = 1,
    NORTH_EAST = 2,
    NORTH_WEST = 3,
    EAST = 4,
    WEST = 5,
    SOUTH = 6,
    SOUTH_EAST = 7,
    SOUTH_WEST = 8,
}

// structs

struct Stadium {
    1: optional common.StadiumId id;
    2: optional bool is_active;
    3: optional common.Timestamp created_ts;
    4: optional common.Timestamp updated_ts;
    5: optional string name;
    6: optional common.GeocodeId geocode_id;
    7: optional i64 capacity;
    8: optional i64 elevation;
    9: optional bool is_dome;
    10: optional GrassType grass_type;
    11: optional Direction direction_facing;
    12: optional i64 year_built;
    13: optional common.TeamId team_id;
}

struct StadiumResponse {
    1: optional list<Stadium> stadiums;
}

struct CreateStadiumRequest {
    1: optional bool is_active;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional string name;
    5: optional common.GeocodeId geocode_id;
    6: optional i64 capacity;
    7: optional i64 elevation;
    8: optional bool is_dome;
    9: optional GrassType grass_type;
    10: optional Direction direction_facing;
    11: optional i64 year_built;
    12: optional common.TeamId team_id;
}

struct CreateStadiumResponse {
    1: optional Stadium stadium;
}

struct GetStadiumsRequest {
    1: optional common.StadiumId stadium_id;
    2: optional bool is_active;
    3: optional common.Timestamp created_on_or_after_ts;
    4: optional common.Timestamp updated_on_or_after_ts;
    5: optional common.Timestamp start_on_or_after_ts;
    6: optional common.Timestamp end_on_or_after_ts;
    7: optional common.Timestamp created_before_ts;
    8: optional common.Timestamp updated_before_ts;
    9: optional common.Timestamp start_before_ts;
    10: optional common.Timestamp end_before_ts;
    11: optional common.GeocodeId geocode_id;
    12: optional string name;
    13: optional i64 min_capacity;
    14: optional i64 max_capacity;
    15: optional i64 capacity;
    16: optional i64 min_elevation;
    17: optional i64 max_elevation;
    18: optional i64 elevation;
    19: optional bool is_dome;
    20: optional GrassType grass_type;
    21: optional Direction direction_facing;
    22: optional i64 built_after_year;
    23: optional i64 built_before_year;
    24: optional i64 year_built;
    25: optional common.TeamId team_id;
}

struct GetStadiumsResponse {
    1: optional list<Stadium> stadiums;
}

struct UpdateStadiumsRequest {
    1: optional common.StadiumId stadium_id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional string name;
    5: optional common.GeocodeId geocode_id;
    6: optional i64 capacity;
    7: optional i64 elevation;
    8: optional bool is_dome;
    9: optional GrassType grass_type;
    10: optional Direction direction_facing;
    11: optional i64 year_built;
    12: optional common.TeamId team_id;
}

struct DeleteStadiumRequest {
    1: optional common.StadiumId conference_id;
}


service StadiumService {
    GetStadiumsResponse get_stadiums();

    CreateStadiumResponse create_stadium(
        1: CreateStadiumRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
        3: common.SeasonNotFoundError season_not_found,
        4: common.StadiumNotFoundError stadium_not_found,
    );

    common.Response update_stadiums(
        1: UpdateStadiumsRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_stadium(
        1: DeleteStadiumRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.StadiumNotFoundError stadium_not_found,
    );
}