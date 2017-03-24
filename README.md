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

# Goal
A very configurable end to end testing suite.

# Structure
All tests are built with modularity in mind so that it should be easy to swap out any component for testing or add in more components to the test suite.

# TODOs
Reduce the total file size of the integration tests:

High priority:
- Skin platform installs and tools down to a bare minimum
- Create submodules for h5p integrations
- Set up .gitignore for node_module folders
- Re-use/share containers so we don't have to build multiple similar ones
- Environment variables for silent run (only showing error if a test fails) or rather a --verbose run which would display everything is probably a more standard approach
- Environment variable for pulling latest H5P master version
- Pull common testcafe integration tests out into a separate module

Lower priority:
- Make platform versions configurable with environment variables by pointing to versions
- Make database and php versions configurable with environment variables by pointing to versions
- Make H5P versions configurable by environment variables pointing to integration tags or branches
