namespace js sports
namespace py millcityrunnerthrift.sports

include "common.thrift"

// typedefs

// enums
enum SportStatus {
    ACTIVE = 1,
    INACTIVE = 2,
    NOT_STARTED = 3,
    ON_STRIKE = 4
}

// Next ID: 16
enum Sports {
    BASEBALL = 1,
    BASKETBALL = 2,
    SOCCER = 3,
    FOOTBALL = 4,
    GOLF = 5,
    TENNIS = 6,
    VOLLEYBALL = 7,
    NCAA_FOOTBALL = 8,
    NCAA_MENS_BASKETBALL = 9,
    NCAA_WOMENS_BASKETBALL = 10,
    NCAA_VOLLEYBALL = 11,
    NCAA_MENS_GOLF = 12,
    NCAA_WOMENS_GOLF = 13,
    HOCKEY = 14,
    UFC = 15
}

// structs
struct Sport {
    1: optional common.SportId id,
    2: optional i32 created_ts,
    3: optional i32 updated_ts,
    4: optional bool is_deleted,
    5: optional i32 name,
    6: optional i32 founded_ts,
    7: optional i32 terminated_ts,
}

struct GetSportsResponse {
    1: optional list<Sport> sports,
}

struct CreateSportsResponse {
    1: optional common.SportId id,
    2: optional i32 name,
    3: optional i32 founded_ts,
    4: optional i32 terminated_ts,
    5: optional i32 created_ts,
    6: optional i32 updated_ts,
    7: optional bool is_deleted,
}

struct DeleteSportRequest {
    1: optional common.SportId sport_id,
}

struct CreateSportsRequest {
    1: optional i32 name,
    2: optional i32 founded_ts,
    3: optional i32 terminated_ts,
}

struct UpdateSportsRequest {
    1: optional i32 updated_ts,
    2: optional bool is_deleted,
    3: optional i32 name,
    4: optional i32 founded_ts,
    5: optional i32 terminated_ts,
    6: optional common.SportId sport_id,
}

service SportService {
    GetSportsResponse get_sports();

    CreateSportsResponse create_sport(
        1: CreateSportsRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
    );

    common.Response update_sports(
        1: UpdateSportsRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_sport(
        1: DeleteSportRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.SportNotFoundError sport_not_found,
    );
}