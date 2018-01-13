# Journal

Simple CLI journal
Each record creates it's own file in the hierarchical directory structure based on the year, month, days.
File names are based on unixtime.

## Quick start

1. Just put ```jl``` file into your PATH, or create alias in your shell.
2. Edit section "Settings" in ```jl``` according to your file store and date format.

## Arguments
* ```2-5``` -- range of records from last
* ```-4``` -- last 4 records
* ```+MyTag It is a title of record. It is a body of record. And this is a body.```


## Keystroke commands
* ```5``` -- view record 3
* ```e 4``` -- edit record 4
* ```d 2``` -- delete record 2


```% jl
Enter number of record to view or 0 to exit.
e - edit, d - delete.

% jl +test +journal Test record 1. This is a test record 1.
"Test record 1" is just created.
% jl                

[1] Sat 13 Jan 2018 22:18 Test record 1
Enter number of record to view or 0 to exit.
e - edit, d - delete.
1
_______________________________________
Test record 1

This is a test record 1.

+test +journal
% jl +test +journal Test record 2. This is a test record 2.
"Test record 2" is just created.
% jl

[1] Sat 13 Jan 2018 22:18 Test record 2
[2] Sat 13 Jan 2018 22:18 Test record 1
Enter number of record to view or 0 to exit.
e - edit, d - delete.
2
_______________________________________
Test record 1

This is a test record 1.

+test +journal
% jl +mytag Test record 3. This is a test record 3.
"Test record 3" is just created.
% jl                

[1] Sat 13 Jan 2018 22:18 Test record 2
[2] Sat 13 Jan 2018 22:19 Test record 3
[3] Sat 13 Jan 2018 22:18 Test record 1
Enter number of record to view or 0 to exit.
e - edit, d - delete.

% jl +mytag2 Test record 4. This is a test record 4.
"Test record 4" is just created.
% jl                

[1] Sat 13 Jan 2018 22:20 Test record 4
[2] Sat 13 Jan 2018 22:18 Test record 2
[3] Sat 13 Jan 2018 22:19 Test record 3
[4] Sat 13 Jan 2018 22:18 Test record 1
Enter number of record to view or 0 to exit.
e - edit, d - delete.
e 3

EDITOR HERE

Record 3 is edited.

% jl -2

[1] Sat 13 Jan 2018 22:19 Test record 3
[2] Sat 13 Jan 2018 22:18 Test record 1
Enter number of record to view or 0 to exit.
e - edit, d - delete.
2
_______________________________________
Test record 1

This is a test record 1.

+test +journal

% jl +mytag3 Test record 5. This is a test record 5.
"Test record 5" is just created.
% jl

[1] Sat 13 Jan 2018 22:22 Test record 5
[2] Sat 13 Jan 2018 22:20 Test record 4
[3] Sat 13 Jan 2018 22:18 Test record 2
[4] Sat 13 Jan 2018 22:19 Test record 3
[5] Sat 13 Jan 2018 22:18 Test record 1
Enter number of record to view or 0 to exit.
e - edit, d - delete.

% jl 2-4

[1] Sat 13 Jan 2018 22:20 Test record 4
[2] Sat 13 Jan 2018 22:18 Test record 2
[3] Sat 13 Jan 2018 22:19 Test record 3
Enter number of record to view or 0 to exit.
e - edit, d - delete.
d 3
Record number 3 is deleted.
% jl

[1] Sat 13 Jan 2018 22:22 Test record 5
[2] Sat 13 Jan 2018 22:20 Test record 4
[3] Sat 13 Jan 2018 22:18 Test record 2
[4] Sat 13 Jan 2018 22:18 Test record 1
Enter number of record to view or 0 to exit.
e - edit, d - delete.
```
