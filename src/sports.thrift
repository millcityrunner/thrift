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

// structs
struct Sport {
    1: optional common.SportId id,
    2: optional int created_ts,
    3: optional int updated_ts,
    4: optional bool is_deleted,
    5: optional string name,
    6: optional int founded_ts,
    7: optional int terminated_ts,
}

struct GetSportsResponse {
    1: optional list<Sport> sports,
}

struct CreateSportsResponse {
    1: optional string name,
    2: optional int founded_ts,
    3: optional int terminated_ts,
    4: optional int created_ts,
    5: optional int updated_ts,
    6: optional bool is_deleted,
}

struct DeleteSportRequest {
    1: optional common.SportId sport_id,
}

struct CreateSportsRequest {
    1: optional string name,
    2: optional int founded_ts,
    3: optional int terminated_ts,
}

struct UpdateSportsRequest {
    1: optional int updated_ts,
    2: optional bool is_deleted,
    3: optional string name,
    4: optional int founded_ts,
    5: optional int terminated_ts,
}

service SportService {
    SportResponse get_sports();

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
        2: common.SportNotFound sport_not_found,
    );
}