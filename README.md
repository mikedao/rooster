Rooster API requires param based key authentication with the param, `key`.

Endpoints:

`PUT /api/v1/cohorts`: Forces an update of cohorts and students.

`GET /api/v1/cohorts`: Provides a list of all cohorts.

`GET /api/v1/cohorts/active`: Provides a list of current active cohorts.

`GET /api/v1/cohorts/:id`: Provides a list of students within a cohort. `:id`
will be in the format of "1810-b" or "1901-f".

