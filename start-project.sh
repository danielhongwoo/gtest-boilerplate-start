#!/bin/sh

PROJECT_NAME=$1
PROJECT_NAME_CAPITAL=`echo "${PROJECT_NAME}" | tr a-z A-Z`

echo ${PROJECT_NAME}
echo ${PROJECT_NAME_CAPITAL}

git clone --depth=1 https://github.com/danielhongwoo/gtest-boilerplate.git ${PROJECT_NAME}
cd ${PROJECT_NAME}
rm -rf .git

sed -i "s/name/${PROJECT_NAME}/g" CMakeLists.txt name.h name.cpp main.cpp test_name.cpp

sed -i "s/NAME/${PROJECT_NAME_CAPITAL}/g" CMakeLists.txt name.h name.cpp main.cpp test_name.cpp

mv name.h $PROJECT_NAME.h
mv name.cpp $PROJECT_NAME.cpp
mv test_name.cpp test_$PROJECT_NAME.cpp

mkdir build
