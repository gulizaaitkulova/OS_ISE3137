#!/bin/sh

echo "Starting Operating Systems Week3 Lab assignment"

mkdir tmp_dir
cd tmp_dir
echo "Created a new directory tmp_dir and moved to it\n"

echo "print('HELLO WORLD')" >> hello.py
python3 hello.py
echo "Created a python file with simple commands and executed it\n"

touch hello.cpp
echo "Created a C++ file"

echo "#!/bin/bash" > hello.sh
echo 'echo "HELLO WORLD"' >> hello.sh
chmod +x hello.sh
./hello.sh
echo "Created a bash script and executed it\n"

pwd
echo "Displayed the current working directory\n"

ls
echo "Printed list of files\n"

cd ..
echo "Moved back to original directory\n"

rm -r tmp_dir
echo "Deleted tmp_dir directory\n"

echo "Finished Operating Systems Week3 Lab Assignments"