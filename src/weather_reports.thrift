namespace js weather_reports
namespace py millcityrunnerthrift.weather_reports

include "common.thrift"

struct WeatherReport {
    1: optional common.WeatherReportId id;
}

struct WeatherReportResponse {
    1: optional list<WeatherReport> weather_reports;
}


service WeatherReportService {
    WeatherReportResponse get_weather_reports();
}