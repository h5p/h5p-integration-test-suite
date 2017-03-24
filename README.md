# Prerequisites
To be able to run this test suite you must make sure you have the following installed:

- docker (and docker-compose)
- node
- npm
- git
- chrome browser

# How to use
To run the integration tests just run the test suite script:

```bash
./run-test-suite.sh
```

# Structure
All tests are built with modularity in mind so that it should be easy to swap out any component.

# TODOs
High priority:
- Environment variable for pulling latest H5P master version
- Pull common testcafe integration tests out into a separate module

Lower priority:
- Make platform versions configurable with environment variables by pointing to versions
- Make database and php versions configurable with environment variables by pointing to versions
- Make H5P versions configurable by environment variables pointing to integration tags or branches
