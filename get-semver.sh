#!/bin/bash

MR_SRC_BRANCH=$1

# TODO add some validations on the input

if [[ "$MR_SRC_BRANCH" == *"PATCH"* ]]; then
    sem_ver=$(git semver patch --dryrun)
elif [[ "$MR_SRC_BRANCH" = *"MINOR"* ]]; then
    sem_ver=$(git semver minor --dryrun)
elif [[ "$MR_SRC_BRANCH" = *"MAJOR"* ]]; then
    sem_ver=$(git semver major --dryrun)
fi

# TODO add some validations on the ouput

echo $sem_ver