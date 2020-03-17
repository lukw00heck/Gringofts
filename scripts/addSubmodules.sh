#!/bin/bash
# run this script under project's dir
set -x
DIR=$(pwd)
# this script sets up all dependent submodules
SUMMARY=$(git submodule summary)
# cppint
CPPLINT="third_party/cpplint"
if [[ "$SUMMARY" == *"$CPPLINT"* ]]; then
  echo "Skipping $CPPLINT"
else
  cd "$DIR" || return
  git submodule add -f https://github.com/cpplint/cpplint "$CPPLINT"
  cd "$CPPLINT" || return
  git checkout 2a22afe
fi
# gtest
GTEST="third_party/gtest"
if [[ "$SUMMARY" == *"$GTEST"* ]]; then
  echo "Skipping $GTEST"
else
  cd "$DIR" || return
  git submodule add -f https://github.com/google/googletest.git "$GTEST"
  cd "$GTEST" || return
  git checkout 2fe3bd9
fi
# inih
INIH="third_party/inih"
if [[ "$SUMMARY" == *"$INIH"* ]]; then
  echo "Skipping $INIH"
else
  cd "$DIR" || return
  git submodule add -f https://github.com/benhoyt/inih.git "$INIH"
  cd "$INIH" || return
  git checkout 9d1af9d
fi
# spdlog
SPDLOG="third_party/spdlog"
if [[ "$SUMMARY" == *"$SPDLOG"* ]]; then
  echo "Skipping $SPDLOG"
else
  cd "$DIR" || return
  git submodule add -f https://github.com/gabime/spdlog.git "$SPDLOG"
  cd "$SPDLOG" || return
  git checkout 10578ff
fi
# CodeCoverage
wget https://raw.githubusercontent.com/bilke/cmake-modules/master/CodeCoverage.cmake
mv CodeCoverage cmake/g++-7/CodeCoverage