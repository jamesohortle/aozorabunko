#!/bin/bash
convert(){
    echo $1
    enc=$(python3 -c "from chardet import detect; det = detect(open('$1', mode='rb').read()); print(det['encoding']);")
    iconv -f $enc -t UTF-8 $1 > $1
}

find . -name "*.html" -type f |
while read file
do
    convert $file
done
