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
struct Franchise {
    1: optional common.FranchiseId id;
    2: optional common.Timestamp created_ts;
    3: optional common.TeamId root_team_id;
    4: optional common.TeamId team_id;
    5: optional bool is_active;
    6: optional common.Timestamp updated_ts;
    7: optional FranchiseStatus status;
}

struct FranchiseResponse {
    1: optional list<Franchise> franchises;
}

struct CreateFranchiseRequest {
    1: optional common.Timestamp created_ts;
    2: optional common.Timestamp updated_ts;
    3: optional bool is_active;
    4: optional common.TeamId root_team_id;
    5: optional common.TeamId team_id;
    6: optional FranchiseStatus status;
}

struct CreateFranchiseResponse {
    1: optional Franchise franchise;
}

struct GetFranchisesRequest {
    1: optional common.FranchiseId franchise_id;
    2: optional bool is_active;
    3: optional common.Timestamp created_on_or_after_ts;
    4: optional common.Timestamp updated_on_or_after_ts;
    5: optional common.Timestamp created_before_ts;
    6: optional common.Timestamp updated_before_ts;
    7: optional common.TeamId root_team_id;
    8: optional common.TeamId team_id;
    9: optional FranchiseStatus status;
}

struct GetFranchisesResponse {
    1: optional list<Franchise> franchises;
}

struct UpdateFranchisesRequest {
    1: optional common.FranchiseId franchise_id;
    2: optional bool is_active;
    3: optional common.Timestamp created_on_or_after_ts;
    4: optional common.Timestamp updated_on_or_after_ts;
    5: optional common.Timestamp created_before_ts;
    6: optional common.Timestamp updated_before_ts;
    7: optional common.TeamId root_team_id;
    8: optional common.TeamId team_id;
    9: optional FranchiseStatus status;
}

struct DeleteFranchiseRequest {
    1: optional common.FranchiseId franchise_id;
}

service FranchiseService {
    GetFranchisesResponse get_franchises();

    CreateFranchiseResponse create_franchise(
        1: CreateFranchiseRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
        4: common.TeamNotFoundError team_not_found,
    );

    common.Response update_franchises(
        1: UpdateFranchisesRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_franchise(
        1: DeleteFranchiseRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.FranchiseNotFoundError franchise_not_found,
    );
}