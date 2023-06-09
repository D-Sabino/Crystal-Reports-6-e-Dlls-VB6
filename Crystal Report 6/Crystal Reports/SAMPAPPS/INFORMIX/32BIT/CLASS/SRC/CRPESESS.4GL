
-- ------------------------------------------------------------------           
-- Class Name    : CRPESessionInfo
-- File Name     : CRPESess.4gl
-- Project       : Crystal Report Writer C++ Classes for Informix-NewEra
-- Author        : Jack Suto
-- Creation Date : 01/27/96
-- Generated by  : CLIK Builder - Version 2.00.WC1
-- ------------------------------------------------------------------           
-- Comments 	
--
--
-- ------------------------------------------------------------------           
-- History
--
--
-- ------------------------------------------------------------------           

-- ------------------------------------------------------------------           
-- INCLUDE Definitions
-- ------------------------------------------------------------------           
INCLUDE "CRPESess.4gh"


-- ------------------------------------------------------------------           
-- FUNCTION CRPESessionInfo::CRPESessionInfo
-- ------------------------------------------------------------------           
FUNCTION CRPESessionInfo::CRPESessionInfo(
           userID  CHAR(*),
           password  CHAR(*),
           sessionHandle  INTEGER )

	LET m_userID = userID clipped
	LET m_password = password clipped
	LET m_sessionHandle = sessionHandle


END FUNCTION

-- ------------------------------------------------------------------           
-- FUNCTION CRPESessionInfo::!destroy
-- ------------------------------------------------------------------           
FUNCTION CRPESessionInfo::!destroy()

END FUNCTION

-- ------------------------------------------------------------------           
-- End of file : CRPESess.4gl
-- ------------------------------------------------------------------           
