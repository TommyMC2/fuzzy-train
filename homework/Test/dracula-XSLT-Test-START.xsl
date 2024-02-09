<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Dracula</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1 id="top">
                    <xsl:value-of select="/root/title"/>
                </h1>


                <section id="contents">
                    <table>
                        <tr>
                            <th>Chapter Number</th>
                            <th>Locations</th>
                            <th>Tech</th>
                        </tr>
                        <xsl:apply-templates select="/root/chapter" mode="toc"/>
                    </table>
                </section>


                <section id="readingView">
                    <xsl:apply-templates select="/root/chapter"/>
                </section>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="chapter" mode="toc">
        <tr>
            <td>
                <a href="#{translate(heading, ' ', '-')}">
                    <xsl:value-of select="heading"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="string-join(distinct-values(p/location[text()]), ', ')"/>
            </td>
            <td>
                <xsl:value-of select="string-join(distinct-values(p/tech[text()]), ', ')"/>
            </td>
        </tr>
    </xsl:template>


    <xsl:template match="chapter">
        <h2 id="{translate(heading, ' ', '-')}">
            <xsl:value-of select="heading"/>
        </h2>
        <xsl:apply-templates select="p"/>
    </xsl:template>


    <!-- Template for the p element -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates select="text() | date | time | tech | location"/>
        </p>
    </xsl:template>


    <!-- Templates for location, tech, date, and time elements -->
    <xsl:template match="location | tech | date | time">
        <span class="{local-name()}">
            <xsl:value-of select="@* | text()"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
