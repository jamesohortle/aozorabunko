#!/bin/bash
convert(){
    echo $1
    enc=$(python3 -c "from chardet import detect; det = detect(open('$1', mode='rb').read()); print(det['encoding']);")
    iconv -f $enc -t UTF-8 $1 > $1.utf8
    rm $1
    mv $1.utf8 $1
    git add .
    git commit -m "Convert $1"
    git push origin master 
}

find . -name "*.html" -type f |
while read file
do
    convert $file
done
