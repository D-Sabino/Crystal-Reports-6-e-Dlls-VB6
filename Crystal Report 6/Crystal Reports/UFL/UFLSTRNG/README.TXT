** UFLSTRNG.DLL  **

Created by:	Fred Tummonds, Crystal Technical Services
		Dec. 31/94


Exported Functions:

This DLL contains the following functions that can be used from the Crystal Reports
Formula Editor:


SearchString (StringField, Character)

This function will return the number location of the first occurance of 'Character' in 
StringField. If 'Character' is not found in StringField then the length of the string in 
the field will be returned.


StringBeforeChar (StringField, Character)

This function will return the string of characters before the first occurance of
'Character' in StringField.  If 'Character' is not found then the entire string in 
StringField will be returned.


StringAfterChar (StringField, Character)

This function will return the remaining string after the first occurance of 'Character'
in Stringfield.  If 'Character' is not found then this function returns a NULL string.


Example:

StringField = {file.field} = "Tummonds*Fred"
Character = '*'

SearchString({file.field},'*') gives 9.0
StringBeforeChar({file.field},'*') gives the string 'Tummonds'
StringAfterChar({file.field},'*') gives the string 'Fred'

Installation:

To use these functions place UFLSTRNG.DLL in the same directory as CRW.EXE.  When Crystal
Reports first starts these functions will be loaded and they will be available for use from
the formula editor.  You will find them in the Functions section under the heading of 
Additional Functions. 
 
