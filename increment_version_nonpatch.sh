#!/bin/bash

# Increment a version string using Semantic Versioning (SemVer) terminology.

# Parse command line options.

while getopts ":Mm" Option
do
  case $Option in
    M ) major=true;;
    m ) minor=true;;
  esac
done

shift $(($OPTIND - 1))

version=$1

# Build array from version string.

a=( ${version//./ } )

# If version string is missing or has the wrong number of members, show usage message.

if [ ${#a[@]} -ne 2 ]
then
  echo "usage: $(basename $0) [-Mm] major.minor"
  exit 1
fi

# Increment version numbers as requested.

if [ ! -z $major ]
then
  ((a[0]++))
  a[1]=0
fi

if [ ! -z $minor ]
then
  ((a[1]++))
fi

echo "${a[0]}.${a[1]}"
