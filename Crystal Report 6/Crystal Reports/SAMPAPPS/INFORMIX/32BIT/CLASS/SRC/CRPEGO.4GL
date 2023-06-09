
-- ------------------------------------------------------------------           
-- Class Name    : CRPEGraphOptions
-- File Name     : CRPEGO.4GL
-- Project       : Crystal Report Writer C++ Classes for Informix-NewEra
-- Author        : Jack Suto
-- Creation Date : 01/29/96
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
INCLUDE "CRPEGO.4GH"


-- ------------------------------------------------------------------           
-- FUNCTION CRPEGraphOptions::CRPEGraphOptions
-- ------------------------------------------------------------------           
FUNCTION CRPEGraphOptions::CRPEGraphOptions(
           graphMaxValue  FLOAT,
           graphMinValue  FLOAT,
           showDataValue  BOOLEAN,
           showGridLine  BOOLEAN,
           verticalBars  BOOLEAN,
           showLegend  BOOLEAN,
           fontFaceName  CHAR(*) )

	LET m_graphMaxValue = graphMaxValue
	LET m_graphMinValue = graphMinValue
	LET m_showDataValue = showDataValue
	LET m_showGridLine  = showGridLine 
	LET m_verticalBars  = verticalBars
	LET m_showLegend    = showLegend 

END FUNCTION

-- ------------------------------------------------------------------           
-- FUNCTION CRPEGraphOptions::!destroy
-- ------------------------------------------------------------------           
FUNCTION CRPEGraphOptions::!destroy()
END FUNCTION

-- ------------------------------------------------------------------           
-- End of file : CRPEGO.4GL
-- ------------------------------------------------------------------           
