<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <!-- code for the butterfly graph dimensions -->
    <xsl:template match="/">
        <svg height="$max_height + 200" width="$max_width + 200">
         <g>
             
         </g>   
        </svg>
    </xsl:template>
</xsl:stylesheet>