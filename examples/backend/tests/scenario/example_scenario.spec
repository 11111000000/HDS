Scenario: Vertical minimal — health check path
Given a running backend (or mock handler),
When a client performs GET /health,
Then it receives HTTP 200 and JSON body {"status":"ok"},
And no other observable side effects occur.
