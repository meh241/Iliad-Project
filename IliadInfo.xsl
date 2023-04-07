<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
          <head>Iliad</head>
            <link rel="stylesheet" type="text/css" href="placeholder.css"/>      
        <body>
            <xsl:apply-templates/>
        </body>
        </html>
    </xsl:template>
    
    <!-- code for the elements -->
    
    <xsl:template match="book">
            <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="character">
        <span class="character hoverable">
            <xsl:apply-templates/>
        </span>
        <span class="char_hover">
          <xsl:value-of select="@placeholder"/> 
        </span>
    </xsl:template>
    
    <xsl:template match="action">
        <span class="action hoverable">
            <xsl:apply-templates/>
        </span>
        <span class="act_hover">
            <xsl:value-of select="@placeholder"/> 
        </span>
    </xsl:template>
    
    <xsl:template match="emotion">
        <span class="emotion hoverable">
            <xsl:apply-templates/>
        </span>
        <span class="emot_hover">
            <xsl:value-of select="@placeholder"/> 
        </span>
    </xsl:template>
    
    <xsl:template match="lb">
        <br>

        </br>
    </xsl:template>    
   <!-- need to make another CSS file for this xslt --> 
</xsl:stylesheet>