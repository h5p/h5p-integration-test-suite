#!/usr/bin/env bash

# Update submodules
git submodule update --recursive --init

# Run hub endpoint tests
cd hub-api-tests
npm run test
cd ..

# Run Drupal tests
cd drupal-tests
./run-tests.sh
cd ..

# Run Wordpress tests
cd wordpress-tests
./run-tests.sh
cd ..

# Run Moodle tests
cd moodle-tests
./run-tests.sh
cd ..

printf "\n\
***** Finished all tests *****"
