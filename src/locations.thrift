namespace js locations
namespace py millcityrunnerthrift.locations

include "common.thrift"

// typedefs

// enums

// structs
struct Location {
    1: optional common.LocationId id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional double latitude;
    5: optional double longitude;
}

struct LocationResponse {
    1: optional list<Location> locations;
}

struct CreateLocationRequest {
    1: optional common.Timestamp created_ts;
    2: optional common.Timestamp updated_ts;
    3: optional double latitude;
    4: optional double longitude;
}

struct CreateLocationResponse {
    1: optional Location location;
}

struct GetLocationsRequest {
    1: optional common.LocationId location_id;
    2: optional common.Timestamp created_on_or_after_ts;
    3: optional common.Timestamp updated_on_or_after_ts;
    4: optional common.Timestamp created_before_ts;
    5: optional common.Timestamp updated_before_ts;
    6: optional double latitude;
    7: optional double longitude;
}

struct GetLocationsResponse {
    1: optional list<Location> locations;
}

struct UpdateLocationsRequest {
    1: optional common.LocationId location_id;
    2: optional common.Timestamp created_on_or_after_ts;
    3: optional common.Timestamp updated_on_or_after_ts;
    4: optional common.Timestamp created_before_ts;
    5: optional common.Timestamp updated_before_ts;
    6: optional double latitude;
    7: optional double longitude;
}

struct DeleteLocationRequest {
    1: optional common.LocationId location_id;
}

service LocationService {
    GetLocationsResponse get_locations();

    CreateLocationResponse create_location(
        1: CreateLocationRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
        4: common.TeamNotFoundError team_not_found,
    );

    common.Response update_locations(
        1: UpdateLocationsRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_location(
        1: DeleteLocationRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.LocationNotFoundError location_not_found,
    );
}