#!/usr/bin/env bash

TESTS=()
# Update submodules
git submodule update --recursive --init

# Run hub endpoint tests
cd hub-api-tests
npm install
npm test
TESTS+=("$?")
cd ..

# Run Drupal tests
cd drupal-tests
source ./run-tests.sh
TESTS+=("$drupaltests")
cd ..

# Run Wordpress tests
cd wordpress-tests
source ./run-tests.sh
TESTS+=("$wordpresstests")
cd ..

# Run Moodle tests
cd moodle-tests
source ./run-tests.sh
TESTS+=("$moodletests")
cd ..

# Print out number of tests which tests failed
successfulltests="${#TESTS[@]}"
for i in "${!TESTS[@]}"
do
  :
  ECHO "What is i ?? $i and value ${TESTS[$i]}"
  if [ "${TESTS[$i]}" == 1 ]
    then successfulltests=$(($successfulltests-1)); ECHO "Test $i failed"
  fi
done

ECHO "Successfull tests: $successfulltests/${#TESTS[@]}"

# Done!
printf "\n\
***** Finished all tests *****"
