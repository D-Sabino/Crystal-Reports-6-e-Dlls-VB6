u2lexpo.dll is a 32bit User Function Library for CRW32.EXE.  You can only use
this dll under Windows NT or Windows 95 environment.

Unzip this file and place u2lexpo.dll in the c:\windows\crystal directory.

This UFL contains two scientific functions:

EXPO(Number1, Number2) - returns a number which is Number1 ^ Number2
    example:  Expo(2,2) => 4

ScNotn(Number1, Number2) - returns a string in scientific notation of Number1,
                           (Number2 - 1) decimal places.
    example:  ScNotn(192389,8) => 1.9238900E+5
