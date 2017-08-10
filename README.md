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
| POST | /nurses | Adds new nurse to database (see below for required and optional parameters) |
| PUT | /nurses/:id | Updates existing nurse in database (see below for optional parameters) |
| DELETE | /nurses/:id | Removes existing nurse in database |

**Where :id is the nurse's database id.**

- To get all nurses in the database in JSON format:
Make a GET request to /nurses

- To get a single nurse's details in JSON format:
Make a GET request to /nurses/:id

- To add a new nurse to the database:
Make a POST request to /nurses with parameters:
  - required: first_name (String), last_name (String), role (String)
  - optional: email (String), phone_number (String)

- To update an existing nurse in the database:
Make a PUT request to /nurses/:id with parameters:
  - optional: first_name (String), last_name (String), role (String), email (String), phone_number (String)

- To remove a nurse from the database:
Make a DELETE request to /nurses/:id

## To do
- Make GET PUT and DELETE work with first and last name instead of id
- Check when posting for record already existing
- Add more edge case tests
