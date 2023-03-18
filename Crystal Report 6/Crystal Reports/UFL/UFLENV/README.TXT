UFLENV.ZIP - June 1, 1995
=========================

This file is a Crystal UFL (User Function Library) which provides additional formula functions within Crystal Reports.

This UFL implements the following function(s):

GetEnvString(Environment String)
--------------------------------
This function takes an environment string parameter and returns the current value of that environment variable.  For example:

GetEnvString("PATH")

would return the path string.  Note that all DOS environment variables MUST be in uppercase.
