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

## To do
- Check when posting for record already existing
- Write api usage instructions
- Add more edge case tests
