namespace js teams
namespace py millcityrunnerthrift.teams

include "common.thrift"
include "divisions.thrift"

// typedefs

// enums

// structs
struct Team {
    1: optional common.TeamId id;
    2: optional string city;
    3: optional string mascot;
    4: optional common.Timestamp created_ts;
    5: optional common.Timestamp updated_ts;
    6: optional common.Timestamp founded_ts;
    7: optional common.Timestamp terminated_ts;
    8: optional string abbreviation;
    9: optional common.DivisionId division_id;
    10: optional bool is_active;
}

struct TeamResponse {
    1: optional list<Team> teams;
}

struct CreateTeamRequest {
    1: optional common.Timestamp founded_ts;
    2: optional common.Timestamp terminated_ts;
    3: optional bool is_active;
    4: optional common.DivisionId division_id;
    5: optional common.Timestamp created_ts;
    6: optional common.Timestamp updated_ts;
    7: optional string city;
    8: optional string mascot;
    9: optional string abbreviation;
}

struct CreateTeamResponse {
    1: optional Team team;
}

struct GetTeamsRequest {
    1: optional common.TeamId team_id;
    2: optional bool is_active;
    3: optional common.Timestamp created_on_or_after_ts;
    4: optional common.Timestamp updated_on_or_after_ts;
    5: optional common.Timestamp founded_on_or_after_ts;
    6: optional common.Timestamp terminated_on_or_after_ts;
    7: optional common.Timestamp created_before_ts;
    8: optional common.Timestamp updated_before_ts;
    9: optional common.Timestamp founded_before_ts;
    10: optional common.Timestamp terminated_before_ts;
    11: optional common.DivisionId division_id;
    12: optional string city;
    13: optional string mascot;
    14: optional string abbreviation;
}

struct GetTeamsResponse {
    1: optional list<Team> teams;
}

struct UpdateTeamsRequest {
    1: optional common.TeamId team_id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional common.Timestamp founded_ts;
    5: optional common.Timestamp terminated_ts;
    6: optional bool is_active;
    7: optional common.DivisionId division_id;
    8: optional string city;
    9: optional string mascot;
    10: optional string abbreviation;
}

struct DeleteTeamRequest {
    1: optional common.TeamId team_id;
}

service TeamService {
    GetTeamsResponse get_teams();

    CreateTeamResponse create_team(
        1: CreateTeamRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
        4: common.DivisionNotFoundError division_not_found,
    );

    common.Response update_teams(
        1: UpdateTeamsRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_team(
        1: DeleteTeamRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.TeamNotFoundError team_not_found,
    );
}