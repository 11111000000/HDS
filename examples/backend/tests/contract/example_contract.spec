Spec: Backend GET /health contract
Expectation:
- When service is healthy, GET /health returns status 200 and body {"status":"ok"} (JSON).
- Response content-type is application/json; charset=utf-8 (or equivalent).
Rationale: Minimal public liveness contract must be deterministic and backward compatible.
