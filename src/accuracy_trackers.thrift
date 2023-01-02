namespace js accuracy_trackers
namespace py millcityrunnerthrift.accuracy_trackers

include "common.thrift"


struct AccuracyTracker {
    1: optional common.AccuracyTrackerId id;
}

struct AccuracyTrackerResponse {
    1: optional list<AccuracyTracker> accuracy_trackers;
}

service AccuracyTrackerService {
    AccuracyTrackerResponse get_accuracy_trackers();
}