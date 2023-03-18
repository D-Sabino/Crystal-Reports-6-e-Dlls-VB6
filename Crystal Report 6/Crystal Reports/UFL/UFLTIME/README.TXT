UFLTIME.DLL

Usage:
If your data field is returning a decimal number which is a fraction of a day, 
you can use this btime() function to change it into a readable format.

Example:  In the formula text:
btime(.25)  --->  returns the string "06:00:00"
btime(.50)  --->  returns the string "12:00:00"
btime(.66)  --->  returns the string "15:50:24"
btime(.75)  --->  returns the string "18:00:00"
btime(1.0)  --->  returns the string "24:00:00"

