UFLJUL.DLL
----------

The user function library DLL contains the following functions for 
Julian date conversion:

1. DateToJulian (date) - takes a date parameter and returns the 
   Julian date value.

2. JulianToDate (number) - takes a Julian date as parameter and 
   returns the date value.


Sample formulas:
----------------

1. Convert the date 12/25/1995 to julian:

DateToJulian (date(1995,12,25))


2. Convert a julian date field to a normal date:

JulianToDate ({table.date})


Some date fields use a special julian-type date format that is based
on a particular date, for example January 1, 1900.  The following
formulas would convert them:

3. Convert the date 12/25/1995 to the special julian date:

DateToJulian(<date>) - DateToJulian(Date(1900,1,1)-1) 


4. Convert a special julian date field to normal date:

JulianToDate( DateToJulian(Date(1900,01,01)-1) + {table.date} )



Crystal Technical Support
Phone: (604) 669-8379
Fax  : (604) 681-7163
FOD  : (604) 681-3450
BBS  : (604) 681-9516
CIS  : GO REPORTS
Web  : http://www.seagate.com/software/crystal/technical

