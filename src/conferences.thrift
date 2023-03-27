namespace js conferences
namespace py millcityrunnerthrift.conferences

include "common.thrift"
include "seasons.thrift"

// typedefs

// enums
enum Conferences {
    AMERICAN = 1, // nfl, mlb
    NATIONAL = 2, // nfl, mlb
    EASTERN = 3, // nba, nhl
    WESTERN = 4, // nba, nhl
}

// structs
struct Conference {
    1: optional common.ConferenceId id;
    2: optional string name;
    3: optional bool is_active;
    4: optional common.SeasonId season_id;
    5: optional common.Timestamp created_ts;
    6: optional common.Timestamp updated_ts;
    7: optional common.Timestamp start_ts;
    8: optional common.Timestamp end_ts;
}

struct ConferenceResponse {
    1: optional list<Conference> conferences;
}

struct CreateConferenceRequest {
    1: optional common.Timestamp start_ts;
    2: optional common.Timestamp created_ts;
    3: optional bool is_active;
    4: optional common.SeasonId season_id;
    5: optional common.Timestamp end_ts;
    6: optional common.Timestamp updated_ts;
    7: optional Conferences name;
}

struct CreateConferenceResponse {
    1: optional Conference conference;
}

struct GetConferencesRequest {
    1: optional common.SeasonId season_id;
    2: optional bool is_active;
    3: optional common.Timestamp created_on_or_after_ts;
    4: optional common.Timestamp updated_on_or_after_ts;
    5: optional common.Timestamp start_on_or_after_ts;
    6: optional common.Timestamp end_on_or_after_ts;
    7: optional common.Timestamp created_before_ts;
    8: optional common.Timestamp updated_before_ts;
    9: optional common.Timestamp start_before_ts;
    10: optional common.Timestamp end_before_ts;
    11: optional common.ConferenceId conference_id;
    12: optional Conferences name;
}

struct GetConferencesResponse {
    1: optional list<Conference> conferences;
}

struct UpdateConferencesRequest {
    1: optional common.ConferenceId conference_id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional common.Timestamp start_ts;
    5: optional common.Timestamp end_ts;
    6: optional bool is_active;
    7: optional common.SeasonId season_id;
    8: optional Conferences name;
}

struct DeleteConferenceRequest {
    1: optional common.ConferenceId conference_id;
}

service ConferenceService {
    GetConferencesResponse get_conferences();

    CreateConferenceResponse create_conference(
        1: CreateConferenceRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
        3: common.SeasonNotFoundError season_not_found,
        4: common.ConferenceNotFoundError conference_not_found,
    );

    common.Response update_conferences(
        1: UpdateConferencesRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_conference(
        1: DeleteConferenceRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.ConferenceNotFoundError conference_not_found,
    );
}
