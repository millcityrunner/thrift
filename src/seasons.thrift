namespace js seasons
namespace py millcityrunnerthrift.seasons

include "common.thrift"

// typedefs

// enums
enum SeasonStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    NOT_STARTED = 3,
    CANCELED = 4,
}

// structs
struct Season {
    1: optional common.SeasonId id;
    2: optional common.Timestamp start_ts;
    3: optional common.Timestamp end_ts;
    4: optional common.Timestamp created_ts;
    5: optional common.Timestamp updated_ts;
    6: optional bool is_active;
    7: optional common.SportId sport_id;
}

struct SeasonResponse {
    1: optional list<Season> seasons;
}

struct CreateSeasonRequest {
    1: optional common.Timestamp start_ts;
    2: optional common.Timestamp created_ts;
    3: optional bool is_active;
    4: optional common.SportId sport_id;
    5: optional common.Timestamp end_ts;
    6: optional common.Timestamp updated_ts;
}

struct CreateSeasonResponse {
    1: optional Season season;
}

struct GetSeasonsRequest {
    1: optional common.SportId sport_id;
    2: optional bool is_active;
    3: optional common.Timestamp created_after_ts;
    4: optional common.Timestamp updated_after_ts;
    5: optional common.Timestamp start_after_ts;
    6: optional common.Timestamp end_after_ts;
    7: optional common.Timestamp created_before_ts;
    8: optional common.Timestamp updated_before_ts;
    9: optional common.Timestamp start_before_ts;
    10: optional common.Timestamp end_before_ts;
    11: optional common.SeasonId season_id;
}

struct GetSeasonsResponse {
    1: optional list<Season> seasons;
}

struct UpdateSeasonsRequest {
    1: optional common.SeasonId season_id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional common.Timestamp start_ts;
    5: optional common.Timestamp end_ts;
    6: optional bool is_active;
    7: optional common.SportId sport_id;
}

struct DeleteSeasonRequest {
    1: optional common.SeasonId season_id;
}

service SeasonService {
    GetSeasonsResponse get_seasons(
        1: GetSeasonsRequest request
    ) throws (
        1: common.NotFound not_found,
        2: common.InvalidRequest invalid_request,
    );

    CreateSeasonResponse create_season(
        1: CreateSeasonRequest request
    ) throws (
        1: common.ResourceAlreadyExists resource_already_exists,
        2: common.NotFound not_found,
    );

    common.Response update_season(
        1: UpdateSeasonRequest request
    ) throws (
        1: common.NotFound not_found;
    );

    common.Response delete_season(
        1: DeleteSeasonRequest request
    ) throws (
        1: common.NotFound not_found,
    );
}