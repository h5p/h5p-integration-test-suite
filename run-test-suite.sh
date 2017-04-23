#!/usr/bin/env bash
# shellcheck disable=SC1091

TESTS=()
ERRORS=()

# Run hub endpoint tests
cd hub-api-tests || exit
npm install
npm test
hubapitests=$?
TESTS+=("$hubapitests")
ERRORS+=("Hub api tests")
cd .. || exit

# Run Drupal tests
(
cd drupal-tests || exit
source ./run-tests.sh
)
drupaltests=$?
TESTS+=("$drupaltests")
ERRORS+=("Drupal integration tests")

# Run Wordpress tests
(
cd wordpress-tests || exit
source ./run-tests.sh
)
wordpresstests=$?
TESTS+=("$wordpresstests")
ERRORS+=("Wordpress integration tests")

# Run Moodle tests
(
cd moodle-tests || exit
source ./run-tests.sh
)
moodletests=$?
TESTS+=("$moodletests")
ERRORS+=("Moodle intgration tests")

(
cd drupal-tests || exit
source ./php-syntax-check.sh
)
drupalphplint=$?
TESTS+=("$drupalphplint")
ERRORS+=("Drupal php compatibility linter")

(
cd wordpress-tests || exit
source ./php-syntax-check.sh
)
wpphplint=$?
TESTS+=("$wpphplint")
ERRORS+=("Wordpress php compatibility linter")

(
cd moodle-tests || exit
source ./php-syntax-check.sh
)
moodlephplint=$?
TESTS+=("$moodlephplint")
ERRORS+=("Moodle php compatibility linter")

# Print out number of tests which tests failed
successfulltests="${#TESTS[@]}"
for i in "${!TESTS[@]}"
do
  :
  if [ "${TESTS[$i]}" != 0 ]
    then successfulltests=$((successfulltests-1)); ECHO "${ERRORS[$i]} has failed."
  fi
done

echo "Successfull tests: $successfulltests/${#TESTS[@]}"

# Done!
printf "\n\
***** Finished all tests *****"
