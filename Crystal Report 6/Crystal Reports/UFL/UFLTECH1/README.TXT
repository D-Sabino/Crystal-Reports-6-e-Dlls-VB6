UFLTECH1.DLL

User Function Library


===


User Defined Function Summary
---------------------------------------------------------------------
        Function                Action
        -------------------------------------------------------------

        SquareRoot (X)          Returns the square root of X.

        StripString (X, Y)      Removes all occurences of Y from X.

        GetInitials (X)         Returns a string of the first letters
                                of every word in X.

        GetWord (X, Y)          Returns the Yth word in X.


===



SquareRoot (X)
---------------------------------------------------------------------
        Format:
                SquareRoot (X)

                - where X is the number for which you want the square 
                root returned

        Action:
                SquareRoot returns the square root of X, or an error
                message if X is negative.

        Typical Uses:

        Examples:
                SquareRoot (16)                 = 4

                SquareRoot (73)                 = 8.54

                SquareRoot (-8)                 = Error


===


StripString (X, Y)
---------------------------------------------------------------------
        Format:
                StripString (X, Y)

                - where X is the string to strip from and Y is the 
                string to strip out

        Action:
                StripString removes all occurences of the string Y 
                from the string X.

        Typical Uses:

        Examples:
                StripString ("1, 3, 17, 24", ",")
                                                = "1 3 17 24"

                StripString ("This is a test.", "is")
                                                = "Th  a test."


===


GetInitials (X)
---------------------------------------------------------------------
        Format:
                GetInitials (X)

                - where X is a string from which you would like the
                first letter of every word

        Action:
                GetInitials returns the first letter of every word in
                a string.  But, it does not place periods after each.

        Typical Uses:

        Examples:
                GetInitials ("John J. Doe")     = "JJD"

                GetInitials ("University of British Columbia")
                                                = "UoBC"


===


GetWord (X, Y)
---------------------------------------------------------------------
        Format:
                GetWord (X, Y)

                - where X is a string and Y is a number indicating
                which word to get

        Action:
                GetWord returns a the Yth word from a string.

        Typical Uses:

        Examples:
                GetWord ("John J. Doe", 3)      = "Doe"

                GetWord ("Doe, John J.", 1)     = "Doe"


===


Technical Support,
Crystal Services.
