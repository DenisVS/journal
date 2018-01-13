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
