# Holidays API

### Overview

The Holidays API is a RESTful service designed to provide information about holidays for specific countries or regions (provinces, states, or departments).

## Requirements

* The project is developed as a REST API.
* The core functionality of the system, separate from the API layer.

### Constraints

1. To initialize the project, use the following command:

```bash
  rails new holidays --api -T
```

## Technologies

The following technologies are used in this project:

||Version|Command for checking
|-|-:|-|
|ruby|3.2.3|ruby --version|
|rails|7.1.3.2|rails --version|

## Deployment

To deploy the application, follow these steps:

1. Install dependencies:

```bash
  bundle install
```

2. Start the server:

```bash
  bin/rails serve
```

## API Reference

To access the API documentation, perform the following steps:

1. Retrieve the documentation:

```bash
curl  -X GET \
  'localhost:3000/api/docs' \
  --header 'Accept: */*'
```

2. Copy the content and visualize it using [Swagger Editor](https://editor.swagger.io/)


## Running Tests

Execute the following command to run the tests:

```bash
   bundle exec rspec spec/
```

## Solution Approach

The solution for building the Holidays API involves the following steps:

1. **Choosing the Framework:** We opted to use the Grape framework for building our RESTful API. Grape provides a lightweight and flexible approach to define API endpoints and manage request handling.

2. **Entity Serialization:** To ensure clean and structured responses from our API, we use Grape Entity for entity serialization. This allows us to define the structure of our API responses in a clear and organized manner.

3. **Documentation Generation:** We integrate Grape Swagger and Grape Swagger Entity to automatically generate Swagger-compliant documentation for our API. This ensures that our API endpoints are well-documented and easy to explore.

4. **Testing Strategy:** We employ RSpec and related gems for behavior-driven development (BDD) and testing. RSpec Rails provides a robust framework for testing Rails applications, while Rack Test allows us to test Rack applications with a simple API. Additionally, we use RSpec JSON Expectations for validating JSON responses in our tests.

5. **Code Quality:** To maintain code quality and adherence to best practices, we utilize RuboCop, a linter for Ruby code. RuboCop helps us enforce consistent coding styles and identify potential issues in our codebase.

6. **Service Objects:** The core functionality of the system is organized using the concept of service objects. The service objects responsible for retrieving holiday data and processing it reside in the `app/services/core` directory. This approach promotes encapsulation and modularity, making our codebase easier to understand and maintain.

## Installed Gems

The following gems are installed for the project:

- `grape`: REST-like API framework for Ruby.
- `grape-entity`: Entity serialization for Grape APIs.
- `grape-swagger`: Adds Swagger-compliant documentation to your Grape API.
- `grape-swagger-entity`: Swagger documentation for Grape entities.
- `rspec-rails`: Behavior-driven development for Ruby on Rails applications.
- `rack-test`: Add the 'rack/test' gem for testing Rack applications with a simple API.
- `rspec-json_expectations`: Integrate 'rspec/json_expectations' gem for additional JSON-related expectations in RSpec.
- `byebug`: Debugging tool for Ruby.
- `rubocop`: Linter for Ruby code.
