#!/bin/bash

read -p "Folder 1: " folder1
read -p "Folder 2: " folder2

cd $folder1 || RETURN
find . -type f | shasum -a 512 * | tee folder1.txt

cd .. || RETURN
cd $folder2 || RETURN
find . -type f | shasum -a 512 * | tee folder2.txt

cd .. || RETURN

echo "============================================="
echo "============================================="
echo "The difference(s) between the files in the two folders are: "
diff <(cat $folder1/folder1.txt) <(cat $folder2/folder2.txt) | grep -v folder1 | grep -v folder2
