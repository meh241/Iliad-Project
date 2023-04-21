<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <!-- code for the butterfly graph dimensions -->
    <!--Variables -->
    <xsl:variable name="bar_height" as="xs:double" select="18"/>
    <xsl:variable name="spacing" as="xs:double" select="$bar_height div 2"/>
    <xsl:variable name="max_height" as="xs:double"
        select="($bar_height + $spacing) * count(//emotion/distinct-values(@felt)) + 9"/>
    <xsl:variable name="half_width" as="xs:double" select="250"/>
    <xsl:variable name="max_width" as="xs:double" select="$half_width * 2"/>
    <xsl:variable name="xscale" as="xs:double" select="5"/>
    <!-- Axes-->
    <xsl:template match="/">
        <svg height="{$max_height + 200}" width="{$max_width + 200}">
            <g transform="translate({$half_width + 50}, 100)">
                <line x1="-{$half_width}" x2="{$half_width}" y1="0" y2="0" stroke="black"/>
                <line x1="0" x2="0" y1="0" y2="{$max_height}" stroke="black"/>
                <!-- Axis Lables -->
                <text x="{$half_width div 2}" y="-50" font-size="16" text-anchor="middle"
                    font-weight="300">Count: "Internal"</text>
                    <text x="-{$half_width div 2}" y="-50" font-size="16" text-anchor="middle"
                        font-weight="300">Count: "External"</text>
                    <text x="0" y="{$max_height + 50}" font-size="18" text-anchor="middle"
                        font-weight="300">Internal vs Extrernal Displays of Emotion"</text>
                <!-- Ruling Lines and Number Lables -->
                <xsl:for-each select="0 to 5">
                    <xsl:variable name="pos" as="xs:double" select=". * ($half_width div 5)"/>
                    <text y="-20" x="{$pos}" font-size="13" text-anchor="middle">
                        <xsl:value-of select=".*5"/>
                    </text>
                    <line y1="-15" y2="0" x1="{$pos}" x2="{$pos}" stroke="black"/>
                    <line y1="0" y2="{$max_height}" x1="{$pos}" x2="{$pos}" stroke="black"
                        opacity=".5"/>
                </xsl:for-each>
                <xsl:for-each select="-5 to -1">
                    <xsl:variable name="pos" as="xs:double" select=". * ($half_width div 5)"/>
                    <text y="-20" x="{$pos}" font-size="13" text-anchor="middle">
                        <xsl:value-of select="-(.*5)"/>
                    </text>
                    <line y1="-15" y2="0" x1="{$pos}" x2="{$pos}" stroke="black"/>
                    <line y1="0" y2="{$max_height}" x1="{$pos}" x2="{$pos}" stroke="black"
                        opacity=".5"/> </xsl:for-each>              
                <!--Generating Bars -->
                <xsl:for-each-group select="//emotion/@felt" group-by="." >
                    <xsl:variable name="internal-length" as="xs:double" select="count(//emotion[@felt=current-grouping-key() and @type='internal'])"/>
                    <xsl:variable name="external-length" as="xs:double" select="count(//emotion[@felt=current-grouping-key() and @type='external'])"/>
                    <rect width="{$internal-length*10}" height="100" x="0" y="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)">Internal</rect>
                    <rect width="{$external-length*10}" height="100" x="-{$external-length*10}" y="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)">Extrenal</rect>
                </xsl:for-each-group>
                
                
         </g>   
        </svg>
    </xsl:template>
</xsl:stylesheet>