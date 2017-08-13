# Nurse record API

API endpoints for a nurse resource using Rails.

Implements the following endpoints:
* View all nurses in the system
* View a single nurse object
* Create a single nurse object
* Update a single nurse object
* Delete a single nurse object

## To get a local copy

```bash
git clone https://github.com/sblausten/nurse-api.github
cd nurse-api
bundle i
rails db:migrate
```

## To run tests

```bash
rspec
```

The first time you may need to use:
```bash
rake spec
```

## Usage
**For safety, prefer endpoints utilising the id rather than first and last name when making requests via PUT or DELETE.**

Cheatsheet:

| Request | Address | Action |
|:-:|---|---|
| GET | /api/nurses | Returns all nurses |
| GET | /api/nurses/:id | Returns nurse object matching that id  |
| GET | /api/nurses/:first_name/:last_name | Returns nurse object matching that first and last name  |
| POST | /api/nurses | Adds new nurse to database (see below for required and optional parameters) |
| PUT | /api/nurses/:id | Updates existing nurse in database (see below for optional parameters) |
| PUT | /api/nurses/:first_name/:last_name | Updates existing nurse in database (see below for optional parameters) |
| DELETE | /api/nurses/:id | Removes existing nurse in database |
| DELETE | /api/nurses/:first_name/:last_name | Removes existing nurse in database |

**Where :id is the nurse's database id.**

- To get all nurses in the database in JSON format:
Make a GET request to /api/nurses

- To get a single nurse's details in JSON format:
Make a GET request to /api/nurses/:id or /api/nurses/:first_name/:last_name

- To add a new nurse to the database:
Make a POST request to /api/nurses with parameters:
  - required: first_name (String), last_name (String), role (String)
  - optional: email (String), phone_number (String)

- To update an existing nurse in the database:
Make a PUT request to /api/nurses/:id or /api/nurses/:first_name/:last_name with parameters:
  - optional: first_name (String), last_name (String), role (String), email (String), phone_number (String)

- To remove a nurse from the database:
Make a DELETE request to /api/nurses/:id or /api/nurses/:first_name/:last_name

## Considerations
I chose to give users the option of making queries using first_name last_name as well as id for ease of use but it would be safer to also use email. This would avoid unintended alterations where two or more entries have identical names. 

Until this is implemented prefer endpoints utilising the id rather than first and last name.

## To do
- Add more edge case tests
- Add controller tests
- Add email to query url endpoints using first and last name.
- Add model tests
