namespace js stats
namespace py millcityrunnerthrift.stats

include "common.thrift"

struct Stat {
    1: optional common.StatId;
}

struct StatResponse {
    1: optional list<Stat> stats;
}


service StatService {
    StatResponse get_stats();
}