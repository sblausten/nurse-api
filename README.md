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

Cheatsheet:

| Request | Address | Action |
|:-:|---|---|
| GET | /nurses | Returns all nurses |
| GET | /nurses/:id | Returns nurse object matching that id  |
| GET | /nurses/:first_name/:last_name | Returns nurse object matching that first and last name  |
| POST | /nurses | Adds new nurse to database (see below for required and optional parameters) |
| PUT | /nurses/:id | Updates existing nurse in database (see below for optional parameters) |
| PUT | /nurses/:first_name/:last_name | Updates existing nurse in database (see below for optional parameters) |
| DELETE | /nurses/:id | Removes existing nurse in database |
| DELETE | /nurses/:first_name/:last_name | Removes existing nurse in database |

**Where :id is the nurse's database id.**

- To get all nurses in the database in JSON format:
Make a GET request to /nurses

- To get a single nurse's details in JSON format:
Make a GET request to /nurses/:id or /nurses/:first_name/:last_name

- To add a new nurse to the database:
Make a POST request to /nurses with parameters:
  - required: first_name (String), last_name (String), role (String)
  - optional: email (String), phone_number (String)

- To update an existing nurse in the database:
Make a PUT request to /nurses/:id or /nurses/:first_name/:last_name with parameters:
  - optional: first_name (String), last_name (String), role (String), email (String), phone_number (String)

- To remove a nurse from the database:
Make a DELETE request to /nurses/:id or /nurses/:first_name/:last_name

## To do
- Add more edge case tests
