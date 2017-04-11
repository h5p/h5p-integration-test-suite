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

# Test coverage
This section lists important manual tests and if they have been covered by this test suite.

General tests:
- [x] Install H5P
- [x] Check that hub is automatically enabled
- [ ] Upgrade script on content
- [ ] Upload content through hub
- [ ] Create content
- [ ] Edit content
- [ ] Edit content and replace it through upload
- [ ] Upload image through editor
- [ ] Replace image when editing content
- [ ] Temporary file cleanup for new content
- [ ] Temporary file cleanup when editing content
- [ ] Update content type cache from H5P Libraries
- [ ] Update ctc if too old when creating content
- [ ] Update ctc on cron
- [ ] Orders "my content types" by recently used
- [ ] Don't show restricted content types in "my content types"
- [ ] Upload Course Presentation example from H5P.org

Disabled hub:
- [ ] Create content
- [ ] Upload content

# TODOs
High priority:
- Environment variable for pulling latest H5P master version
- Pull common testcafe integration tests out into a separate module

Lower priority:
- Make platform versions configurable with environment variables by pointing to versions
- Make database and php versions configurable with environment variables by pointing to versions
- Make H5P versions configurable by environment variables pointing to integration tags or branches
