<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Epithet Chart</title>
                <style>
                    table {
                        border-collapse: collapse;
                    }
                    table,
                    th,
                    td {
                        border: 1px solid black;
                    }</style>
            </head>
            <body>
                <h2>Epithets</h2>
                <tr>
                    <th>Epithet</th>
                    <th>Who?</th>
                    <th>Connotation?</th>
                </tr>
                <xsl:apply-templates select="//character[@epithet]"/>              
            </body>
        </html>
    </xsl:template>
    <xsl:template match="character">
        <tr>
            <td>
                <xsl:apply-templates select="@epithet"/>               
            </td>
            <td>
                <xsl:apply-templates select="@who"/>
            </td>
            <td>
                <xsl:value-of select="." />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
