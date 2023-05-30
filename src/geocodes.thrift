namespace js geocodes
namespace py millcityrunnerthrift.geocodes

include "common.thrift"

// typedefs

// enums
enum States {
    ALABAMA = 1,
    ALASKA = 2,
    ARIZONA = 3,
    ARKANSAS = 4,
    CALIFORNIA = 5,
    COLORADO = 6,
    CONNECTICUT = 7,
    DELAWARE = 8,
    FLORIDA = 9,
    GEORGIA = 10,
    HAWAII = 11,
    IDAHO = 12,
    ILLINOIS = 13,
    INDIANA = 14,
    IOWA = 15,
    KANSAS = 16,
    KENTUCKY = 17,
    LOUISIANA = 18,
    MAINE = 19,
    MARYLAND = 20,
    MASSACHUSETTS = 21,
    MICHIGAN = 22,
    MINNESOTA = 23,
    MISSISSIPPI = 24,
    MISSOURI = 25,
    MONTANA = 26,
    NEBRASKA = 27,
    NEVADA = 28,
    NEW_HAMPSHIRE = 29,
    NEW_JERSEY = 30,
    NEW_MEXICO = 31,
    NEW_YORK = 32,
    NORTH_CAROLINA = 33,
    NORTH_DAKOTA = 34,
    OHIO = 35,
    OKLAHOMA = 36,
    OREGON = 37,
    PENNSYLVANIA = 38,
    RHODE_ISLAND = 39,
    SOUTH_CAROLINA = 40,
    SOUTH_DAKOTA = 41,
    TENNESSEE = 42,
    TEXAS = 43,
    UTAH = 44,
    VERMONT = 45,
    VIRGINIA = 46,
    WASHINGTON = 47,
    WEST_VIRGINIA = 48,
    WISCONSIN = 49,
    WYOMING =  50
}

enum Countries {
    USA = 1,
}

enum CountryCodes {
    USA = +1,
}

enum Timezones {
    CHICAGO = 1,
    LOS_ANGELES = 2
}

// structs
struct Geocode {
    1: optional common.GeocodeId id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional binary location_id;
    5: optional string city;
    6: optional States state;
    7: optional Countries country;
    8: optional CountryCodes country_code;
    9: optional Timezones timezone;
}

struct GeocodeResponse {
    1: optional list<Geocode> geocodes;
}

struct CreateGeocodeRequest {
    1: optional common.Timestamp created_ts;
    2: optional common.Timestamp updated_ts;
    3: optional double latitude;
    4: optional double longitude;
}

struct CreateGeocodeResponse {
    1: optional Geocode geocode;
}

struct GetGeocodesRequest {
    1: optional common.GeocodeId geocode_id;
    2: optional common.Timestamp created_on_or_after_ts;
    3: optional common.Timestamp updated_on_or_after_ts;
    4: optional common.Timestamp created_before_ts;
    5: optional common.Timestamp updated_before_ts;
    6: optional double latitude;
    7: optional double longitude;
}

struct GetGeocodesResponse {
    1: optional list<Geocode> geocodes;
}

struct UpdateGeocodesRequest {
    1: optional common.GeocodeId geocode_id;
    2: optional common.Timestamp created_on_or_after_ts;
    3: optional common.Timestamp updated_on_or_after_ts;
    4: optional common.Timestamp created_before_ts;
    5: optional common.Timestamp updated_before_ts;
    6: optional double latitude;
    7: optional double longitude;
}

struct DeleteGeocodeRequest {
    1: optional common.GeocodeId geocode_id;
}

service GeocodeService {
    GetGeocodesResponse get_geocodes();

    CreateGeocodeResponse create_geocode(
        1: CreateGeocodeRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.AlreadyExists already_exists,
        4: common.TeamNotFoundError team_not_found,
    );

    common.Response update_geocodes(
        1: UpdateGeocodesRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
    );

    common.Response delete_geocode(
        1: DeleteGeocodeRequest request,
    ) throws (
        1: common.InvalidRequest invalid_request,
        2: common.GeocodeNotFoundError geocode_not_found,
    );
}