namespace js golden_weights
namespace py millcityrunnerthrift.golden_weights

include "common.thrift"


struct GoldenWeight {
    1: optional common.GoldenWeightId;
}

struct GoldenWeightResponse {
    1: optional list<GoldenWeight> golden_weights;
}

service GoldenWeightService {
    GoldenWeightResponse get_golden_weights();
}