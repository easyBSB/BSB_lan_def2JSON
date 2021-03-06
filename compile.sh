#!/bin/sh

# output just KEYs
/usr/bin/clang++ --std=c++11 src/main.cpp -D'LANG=C' -D'LANGS="'KEY'"' -o main && ./main > output.json
for i in CS DE DA DE EL EN ES FI FR HU IT NL PL RU SL SV TR
do
  /usr/bin/clang++ --std=c++11 src/main.cpp -D'LANG='${i} -D'LANGS="'${i}'"' -D'ONLYTEXT' -o main && ./main > output_${i}.json
done
rm main
node src/combine.js

rm output*.json