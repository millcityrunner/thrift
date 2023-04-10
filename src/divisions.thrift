namespace js divisions
namespace py millcityrunnerthrift.divisions

include "common.thrift"
include "conferences.thrift"

// typedefs

// enums
enum Divisions {
    NORTH = 1, // nfl
    EAST = 2, // nfl, mlb
    WEST = 3, // nfl, mlb
    SOUTH = 4, // nfl
    PACIFIC = 5, // nhl, nba
    CENTRAL = 6, // nhl, nba, mlb
    METROPOLITAN = 7, // nhl
    ATLANTIC = 8, // nhl, nba
    NORTH_WEST = 9, // nba
    SOUTH_WEST = 10, // nba
    SOUTH_EAST = 11, // nba
}

// structs
struct Division {
    1: optional common.DivisionId id;
    2: optional string name;
    5: optional common.ConferenceId conference_id;
    6: optional bool is_active;
    7: optional common.Timestamp created_ts;
    8: optional common.Timestamp updated_ts;
    9: optional common.Timestamp start_ts;
    10: optional common.Timestamp end_ts;
}

struct DivisionResponse {
    1: optional list<Division> divisions;
}

struct CreateDivisionRequest {
    1: optional common.Timestamp start_ts;
    2: optional common.Timestamp created_ts;
    3: optional bool is_active;
    4: optional common.ConferenceId conference_id;
    5: optional common.Timestamp end_ts;
    6: optional common.Timestamp updated_ts;
    7: optional Divisions name;
}

struct CreateDivisionResponse {
    1: optional Division division;
}

struct GetDivisionsRequest {
    1: optional common.ConferenceId conference_id;
    2: optional bool is_active;
    3: optional common.Timestamp created_on_or_after_ts;
    4: optional common.Timestamp updated_on_or_after_ts;
    5: optional common.Timestamp start_on_or_after_ts;
    6: optional common.Timestamp end_on_or_after_ts;
    7: optional common.Timestamp created_before_ts;
    8: optional common.Timestamp updated_before_ts;
    9: optional common.Timestamp start_before_ts;
    10: optional common.Timestamp end_before_ts;
    11: optional common.DivisionId division_id;
    12: optional Divisions name;
}

struct GetDivisionsResponse {
    1: optional list<Division> divisions;
}

struct UpdateDivisionsRequest {
    1: optional common.DivisionId division_id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional common.Timestamp start_ts;
    5: optional common.Timestamp end_ts;
    6: optional bool is_active;
    7: optional common.ConferenceId conference_id;
    8: optional Divisions name;
}

struct DeleteDivisionRequest {
    1: optional common.DivisionId division_id;
}

service DivisionService {
    GetDivisionsResponse get_divisions();

    CreateDivisionResponse create_division(
        1: CreateDivisionRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
        3: common.SeasonNotFoundError season_not_found,
        4: common.ConferenceNotFoundError conference_not_found,
    );

    common.Response update_divisions(
        1: UpdateDivisionsRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_division(
        1: DeleteDivisionRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.DivisionNotFoundError conference_not_found,
    );
}