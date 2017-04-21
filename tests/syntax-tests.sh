#!/usr/bin/env bash

TESTS=()

cd drupal-tests
source ./php-syntax-check.sh
TESTS+=("$drupalphpcompatibilitytests")
cd ..

cd wordpress-tests
source ./php-syntax-check.sh
TESTS+=("$wpphpcompatibilitytests")
cd ..

cd moodle-tests
source ./php-syntax-check.sh
TESTS+=("$moodlephpcompatibilitytests")
cd ..

# Print out number of tests which tests failed
successfulltests="${#TESTS[@]}"
for i in "${!TESTS[@]}"
do
  :
  if [ "${TESTS[$i]}" != 0 ]
    then successfulltests=$(($successfulltests-1)); ECHO "Test $i failed"
  fi
done

echo "Successfull tests: $successfulltests/${#TESTS[@]}"

# Done!
printf "\n\
***** Finished all tests *****"
