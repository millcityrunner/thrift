namespace java com.millcityrunner.thrift.common
namespace js common
namespace py millcityrunnerthrift.common



### Typedefs:
typedef binary Uuid;
typedef Uuid SeasonId;
typedef Uuid ConferenceId;
typedef Uuid DivisionId;
typedef Uuid AccuracyTrackerId;
typedef Uuid ContestId;
typedef Uuid FranchiseId;
typedef Uuid GameId;
typedef Uuid GoldenWeightId;
typedef Uuid InjuryReportId;
typedef Uuid LineupId;
typedef Uuid PlatformId;
typedef Uuid PlayerId;
typedef Uuid ProjectionId;
typedef Uuid SportId;
typedef Uuid StadiumId;
typedef Uuid StatId;
typedef Uuid TeamId;
typedef Uuid UserId;
typedef Uuid WeatherReportId;

typedef string Address;
typedef Uuid LocationId;
typedef i64 Timestamp;
typedef string Timezone;  // IANA timezone string (e.g. "America/Los_Angeles")
typedef i16 Year;

### Enums:
enum DayOfWeek {
    MONDAY = 0,
    TUESDAY = 1,
    WEDNESDAY = 2,
    THURSDAY = 3,
    FRIDAY = 4,
    SATURDAY = 5,
    SUNDAY = 6
}

enum YesNoIDontKnow {
    YES = 1;
    NO = 2;
    I_DONT_KNOW = 3;
}

enum Gender {
    MALE = 0,
    FEMALE = 1,
    OTHER = 2,
}

enum Role {
    PLAYER = 1,
    COACH = 2,
    MANAGER = 3,
    AGENT = 4,
    OFFICIAL = 5,
}

enum Positions {
    // NFL
    QB = 1,
    RB = 2,
    WR = 3,
    TE = 4,
    K = 5,
    P = 6,
    PR = 7,
    KR = 8,
    DEF = 9,
    LT = 10,
    LG = 11,
    C = 12,
    RG = 13,
    RT = 14,
    DL = 15,
    MLB = 16,
    OLB = 17,
    CB = 18,
    FS = 19,
    SS = 20,
    LS = 21,
    // MLB
    // NBA
    // SOCCER
    // NHL
    // NCAAMB
    // NCAAF
    // NASCAR
    // TENNIS
    // HORSE_RACING
    // PGA
}

// A general time of day. The time ranges listed below are merely guides and not meant to be
// strictly enforced.
enum TimeOfDay {
    // 7a-12p
    MORNING = 1,
    // 12p-5p
    AFTERNOON = 2,
    // 5p-11p
    EVENING = 3,
    // 11p-7a
    OVERNIGHT = 4,
}

enum FantasyFanaticAppFeatureFlag {}

// Region specific feature flag (regional care team); used to roll out features that should be limited to specific regions
// Next ID: 5
enum RegionGatedFeature {
    // Used exclusively for tests
    TEST_FEATURE = 1,
}

enum Language {
    ENGLISH = 1,
    SPANISH = 2,
    CANTONESE = 3,
    MANDARIN = 4,
    HINDI = 5,
    TAGALOG = 6,
    VIETNAMESE = 7,
    KOREAN = 8,
    JAPANESE = 9,
}

// The type of value a ProfileFieldValue contains
enum ProfileFieldValueType {
    STRING = 1,
    INT = 2,
    ENUM = 3,
    DOUBLE = 4,
    BOOL = 5,
    STRUCT = 6,
    DATE = 7,
}

// The available types of ProfileFields
// Next IDs:
//   All users / recipient-related: 1134
//   CP-related (incl. ATS applicant fields): 2125
//   Internal: 9008
// WHEN ADDING NEW VALUES:
enum ProfileFieldType {

    // All Users
    NICKNAME = 1003,
    GENDER = 1004,
    BIRTH_DATE = 1005,
}

// The available types of ProfileSubFields
// Next ID: 1041
enum ProfileSubFieldType {}

enum ClientType {
    WEB_BROWSER = 0,
    IOS_NATIVE = 1,
    ANDROID_NATIVE = 2,
    COMMAND_LINE_TOOL = 3,
    ANDROID_WEB_WRAPPER = 4,
}

// The available types of ProfileSubFields
// Next id: 27
enum MedicalConditions {
    CANCER = 1,
    DIABETES = 3,
    STROKE = 4,
    DEPRESSION = 9,
    ASTHMA = 10,
    PNEUMONIA = 11,
    COPD = 12,
    INCONTINENCE = 13,
    HEART_DISEASE = 14,
    KIDNEY_DISEASE = 15,
    FRAILTY = 16,
    ARTHRITIS = 17,
    HIP_REPLACEMENT = 18,
    KNEE_REPLACEMENT = 19,
    OSTEOPOROSIS = 20,
    CHF = 21,
    HIGH_BLOOD_PRESSURE = 26,
    // Carepro application only
    IMMOBILITY = 23,
    OVERWEIGHT = 24,
    PERSONALITY_DISORDER = 25,

    // DEPRECATED
    MILD_DEMENTIA = 5,
    SEVERE_DEMENTIA = 6,
    MILD_ALZHEIMERS = 7,
    SEVERE_ALZHEIMERS = 8,

    // DEPRECATED Moved to CognitiveConditions
    PARKINSONS = 2,
    ALZHEIMERS = 22,
}

enum OneTimeExperienceType {}

### Structs:
// Empty response struct. Use this instead of *void* to make sure clients handle
// unrecognized exception well.
struct Response {}

enum Comparator {
    LESS_THAN = 1,
    LESS_THAN_OR_EQUAL_TO = 2,
    EQUAL_TO = 3,
    GREATER_THAN_OR_EQUAL_TO = 4,
    GREATER_THAN = 5,
}

struct Session {
    1: optional UserId user_id;
    3: optional binary session_key;
}

struct Coordinates {
    1: optional double latitude;
    2: optional double longitude;
}

// Represents a time of day. Expressed as 24-hour time.
struct Time {
    // The hour portion of the time.
    1: optional i16 hours;

    // The minute portion of the time.
    2: optional i16 minutes;
}

// Information about a user. Contains only the minimal amount of information
// needed to display a user unless the person viewing the data is an admin
// or the user himself.
// Next ID: 12
struct User {
    // The user's ID.
    1: optional UserId id;

    // The user's full name.
    4: optional string name;
    9: optional string first_name;
    10: optional string last_name;

    // URL to the user's profile image.
    5: optional string image_url;
    7: optional string thumbnail_url;

    // DEPRECATED: use the user's profile to get the gender.
    // The user's gender. Used for visual hints in our thumbnails but
    // may not always be available if inconvenient to fetch.
    11: optional Gender gender;

    // *** ADMIN / SELF ONLY FIELDS ***
    // The following fields will only be visible to admins
    // or if the person is viewing himself.

    // The user's email address.
    2: optional string email;

    // The set of valid roles this user is in.
    3: optional set<Role> roles;

}

// Next ID: 16
enum LocationType {
    // Location of care.

    // This is the default value for recipient locations
    // when the actual type has not been specified
    // (e.g. "Is this a home? an apartment? A facility?").
    UNSPECIFIED_CARE_LOCATION = 1;

    // These location types are explicitly set.
    INDEPENDENT_HOME = 6;
    APARTMENT = 7;
    GATED_COMMUNITY = 8;
    INDEPENDENT_LIVING_FACILITY = 9;
    ASSISTED_LIVING_FACILITY = 10;
    SKILLED_NURSING_FACILITY = 11;
    MEMORY_CARE_FACILITY = 12;
    HOSPITAL = 13;
    OTHER_CARE = 14;
    // Where this client should be taken during an emergency. See recipient
    // profile fields EMERGENCY_PLAN and
    // EMERGENCY_SHELTER_REQUIRES_TRANSPORT_FROM_millcityrunner for more information
    // about the shelter.
    EMERGENCY_SHELTER = 16;

    // Where CarePro tends to be primarily located.  This is usually
    // where the CP lives, but not always.  We used these locations for both
    // analytics purposes as well as for displaying how far away a CP's home base
    // is from any given job.
    //
    // NOTE: This is not always the best indicator of how willing a CP will be
    // to work a job.  We may move away from using these locations for staffing
    // purposes in the future.
    CAREPRO_BASE = 3;

    // Used primarily to store an owner's billing address.
    // Additionally shown on the owner profile.
    OWNER_HOME = 5;

    // DEPRECATED (3/22/2019): As of date, 298 instances in the prod DB.
    // Location of care specifically at a Hospital.
    // No longer used by code anywhere (except tests), but potentially still in the DB.
    DEPRECATED_HOSPITAL = 2;

    // DEPRECATED (3/22/2019): As of date, 0 instances in the prod DB.
    // No longer used by code anywhere (except tests), but potentially still in the DB.
    RECIPIENT_PROVIDED = 4;
}

// A location associated with a care recipient.
// Next ID: 12
struct Location {
    1: optional LocationId location_id;
    2: optional string name;
    3: optional Address address;
    4: optional bool is_primary;
    6: optional Timezone timezone;
    8: optional string phone_number;
}

struct Date {
    1: optional Year year;    // Four digit year.
    2: optional i16 month;   // 1-indexed. (January == 1)
    3: optional i16 day;
}

enum OperatingSystem {
    ANDROID = 0;
    IOS = 1;
}

### Constants:

// This timestamp is some time in the year 6324. Far enough in the future
// that we can ignore, but small enough that it fits in time_t, localtime(),
// gmtime().
const i64 END_OF_TIME = 137400000000;

### Exceptions:
// When the max number of players allowed on the same team is exceeded
exception TooManyPlayersOnSameTeam {}

// The contest is filled up
exception ContestFull {}

// Contest already started
exception ContestAlreadyStarted {}

// The maximum allowed salary for the contest has been exceeded
exception MaxSalaryExceeded {}

// Lineup is incomplete, not all requirements are met
exception LineupIncomplete {}

// Tried to block a relationship that has already been blocked (by the other party).
exception AlreadyBlocked {}

// Tried to create an object that already exists.
exception AlreadyExists {}

// If an expected file does not exist.
exception FileNotFound {}

exception InvalidAmount {}

// Username or password is incorrect/invalid.
exception InvalidCredentials {}

// For endpoints that expect common.Date to be within a certain range
exception InvalidDate {}

// Location ID does not exist in our database, or location is malformed
exception InvalidLocation {}

// Indicates that the user tried to change their password and the server rejected the new password
// because it's potentially insecure. This is not used to indicate that the user entered the
// incorrect password when logging in--that's InvalidCredentials.
exception InadequatePassword {}

// Region ID does not exist in our database.
exception InvalidRegion {}

// Indicates that the request is malformed.
// In other words, "the client should have known better."
// This indicates a bug in the client. Clients should not go out of
// their way to catch this (though it's ok for the client to handle
// unknown errors gracefully). Rather, the client should log the
// exception and we should fix the code.
//
// Examples when it's appropriate to use this:
// - A required field was not specified.
// - Incompatible values were specified for two fields.
// - An invalid user ID was specified. We never delete users, so if
//   a user ID doesn't exist in the database then it NEVER existed,
//   therefore there was never a time when the request could have been
//   valid.
//
// Examples when it's not appropriate to use this:
// - Tried to cancel a visit that was already canceled, since the visit
//   might have been active when the client made the request.
// - Client tried to schedule a visit at a location but the location has
//   been deleted, since the location might not have been deleted until
//   after the client made its request.
exception InvalidRequest {
    1: optional string message;
}

exception InvalidStartTime {}

exception InvalidUser {}

// The location has already been set for this person, and changing location is not currently
// supported for the owner.
exception LocationAlreadySet {}

// Primary locations cannot be deleted.
exception LocationUndeletable {}

// Calling user is not authorized to make this request.
exception NotAuthorized {}

// Attempted to take an action on an appointment that is not allowed
// because the appointment has already started or has been canceled.
exception NotChangeable {}

exception NotCancelable {}

// TODO(david): Replace InvalidUser with this error.
exception UserNotFoundError {}

exception SportNotFoundError {}

// Thrown when we want to return a thrift error to the client, but are unable to be more specific
// about the error type. This typically happens if we're brokering a call to a 3rd party API.
exception UnknownError {
    1: optional string message;
}
