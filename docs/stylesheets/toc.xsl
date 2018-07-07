<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:outline="http://wkhtmltopdf.org/outline" 
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="yes" />
    <xsl:template match="outline:outline">
        <html>
            <head>
                <title>Table of Contents</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <style>
                    h1 {
                        text-align: center;
                        font-size: 20px;
                        font-family: Roboto;
                    }
                    div {
                        border-bottom: 1px dashed rgb(200,200,200);
                        page-break-inside: avoid;
                    }
                    span {
                        float: right;
                    }
                    li {
                        list-style: none; 
                        padding-top: 20px;
                    }
                    li li {
                        padding-top: 5px;
                    }
                    li li li {
                        padding-top: 0px;
                    }
                    ul {
                        font-size: 20px;
                        font-family: Roboto;
                        padding-left: 0em;
                    }
                    ul ul {
                        font-size: 80%;
                        padding-left: 1em;
                    }
                    ul ul ul ul {
                        font-size: 12.8px;
                        margin-top: 0px;
                        margin-bottom: 0px;
                    }
                    ul ul ul ul ul {
                        display: none;
                    }
                    a {text-decoration:none; color: black;}
                </style>
            </head>
            <body>
                <h1>Table of Contents</h1>
                <ul>
                    <xsl:apply-templates select="outline:item/outline:item"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="outline:item">
        <li>
            <xsl:if test="@title!='' and @title!='Reason' and @title!='Example (bad)' and @title!='Example (good)'">
                <div>
                    <a>
                        <xsl:if test="@link">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@link"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@backLink">
                            <xsl:attribute name="name">
                                <xsl:value-of select="@backLink"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="@title" />
                    </a>
                    <span>
                        <xsl:value-of select="@page" />
                    </span>
                </div>
            </xsl:if>
            <ul>
                <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
                <xsl:apply-templates select="outline:item"/>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>