namespace js geocodes
namespace py millcityrunnerthrift.geocodes

include "common.thrift"

// typedefs

// enums
enum States {
    1: ALABAMA
    2: ALASKA
    3: ARIZONA
    4: ARKANSAS
    5: CALIFORNIA
    6: COLORADO
    7: CONNECTICUT
    8: DELAWARE
    9: FLORIDA
    10: GEORGIA
    11: HAWAII
    12: IDAHO
    13: ILLINOIS
    14: INDIANA
    15: IOWA
    16: KANSAS
    17: KENTUCKY
    18: LOUISIANA
    19: MAINE
    20: MARYLAND
    21: MASSACHUSETTS
    22: MICHIGAN
    23: MINNESOTA
    24: MISSISSIPPI
    25: MISSOURI
    26: MONTANA
    27: NEBRASKA
    28: NEVADA
    29: NEW_HAMPSHIRE
    30: NEW_JERSEY
    31: NEW_MEXICO
    32: NEW_YORK
    33: NORTH_CAROLINA
    34: NORTH_DAKOTA
    35: OHIO
    36: OKLAHOMA
    37: OREGON
    38: PENNSYLVANIA
    39: RHODE_ISLAND
    40: SOUTH_CAROLINA
    41: SOUTH_DAKOTA
    42: TENNESSEE
    43: TEXAS
    44: UTAH
    45: VERMONT
    46: VIRGINIA
    47: WASHINGTON
    48: WEST_VIRGINIA
    49: WISCONSIN
    50: WYOMING
}

enum Countries {
    1: USA
}

enum CountryCodes {
    1: 1
}

enum Timezones {
    1: 'America/Chicago'
    2: 'America/Los_Angeles'
}

// structs
struct Geocode {
    1: optional common.GeocodeId id;
    2: optional common.Timestamp created_ts;
    3: optional common.Timestamp updated_ts;
    4: optional binary(16) location_id;
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