#! /bin/bash

rm ./build/*

# build script
echo "#! /bin/bash \n" >> ./build/source-me.sh
cat ./dependencies/first/**.sh >> ./build/source-me.sh
echo "\n" >> ./build/source-me.sh
cat ./vendor/**/**.sh >> ./build/source-me.sh
echo "\n" >> ./build/source-me.sh
cat ./dependencies/last/**.sh >> ./build/source-me.sh
echo "\n" >> ./build/source-me.sh

# build script
echo "#! /bin/bash \n" >> ./build/install-me.sh
cat ./dependencies/first/**.txt >> ./build/install-me.sh
echo "\n" >> ./build/install-me.sh
cat ./vendor/**/**.txt >> ./build/install-me.sh
echo "\n" >> ./build/install-me.sh
cat ./dependencies/last/**.txt >> ./build/install-me.sh
echo "\n" >> ./build/install-me.sh
