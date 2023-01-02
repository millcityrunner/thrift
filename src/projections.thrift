namespace js projections
namespace py millcityrunnerthrift.projections

include "common.thrift"

struct Projection {
    1: optional common.ProjectionId id;
}

struct ProjectionResponse {
    1: optional list<Projection> projections;
}


service ProjectionService {
    ProjectionResponse get_projections();
}