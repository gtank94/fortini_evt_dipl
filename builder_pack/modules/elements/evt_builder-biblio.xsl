<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (C) 2013-2017 the EVT Development Team.

    EVT 1 is free software: you can redistribute it
    and/or modify it under the terms of the
    GNU General Public License version 2
    available in the LICENSE file (or see <http://www.gnu.org/licenses/>).

    EVT 1 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied
    warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.
-->
<xsl:stylesheet xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:eg="http://www.tei-c.org/ns/Examples"
    xmlns:xd="http://www.pnp-software.com/XSLTdoc" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all">

    <xd:doc type="stylesheet">
        <xd:short>
            EN: Fundamental calls to formatting the bibliographical info.
            IT: Le chiamate principali per la formattazione della bibliografia.
        </xd:short>
    </xd:doc>

    <xsl:template match="tei:listBibl">
        <xsl:choose>
            <xsl:when test="biblStruct">
                <xsl:apply-templates select="biblStruct">
                    <xsl:sort order="ascending" select=".//date or .//./date"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:bibl">
                    <xsl:sort order="ascending" select=".//@xml:id"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:list">
        <ul class="listBibl">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:list/tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:listBibl/biblStruct">
        <xsl:element name="p">
            <xsl:attribute name="class">hangInd biblStruct</xsl:attribute>
                <xsl:attribute name="id">
                <xsl:choose>
                  <xsl:when test="@xml:id">
                    <xsl:value-of select="@xml:id"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="concat('biblStruct_', position())"/>
                  </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test=".//author/descendant::surname and .//author/descendant::forename">
                    <xsl:for-each select=".//author/descendant::surname">
                        <xsl:apply-templates select="current()"/>,
                        <xsl:variable name="forename">
                            <xsl:choose>
                                <xsl:when test="current()/following-sibling::forename">
                                    <xsl:value-of select="current()/following-sibling::forename" />
                                </xsl:when>
                                <xsl:when test="current()/preceding-sibling::forename">
                                    <xsl:value-of select="current()/preceding-sibling::forename" />
                                </xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:value-of select="translate(normalize-space(translate($forename,'. ',' .')),'. ',' .')"/>.
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test=".//editor/descendant::surname and .//editor/descendant::forename">
                    <xsl:for-each select=".//editor/descendant::surname">
                        <xsl:apply-templates select="current()"/>,
                        <xsl:variable name="forename">
                            <xsl:choose>
                                <xsl:when test="current()/following-sibling::forename">
                                    <xsl:value-of select="current()/following-sibling::forename" />
                                </xsl:when>
                                <xsl:when test="current()/preceding-sibling::forename">
                                    <xsl:value-of select="current()/preceding-sibling::forename" />
                                </xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:value-of select="translate(normalize-space(translate($forename,'. ',' .')),'. ',' .')"/>.
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select=".//author">
                        <xsl:variable name="author" select="current()"/>
                        <xsl:value-of select="translate(normalize-space(translate($author,'. ',' .')),'. ',' .')"/>.
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:apply-templates select=".//date"/>.
            <xsl:if test="./analytic/title">
                &quot;<xsl:apply-templates select="./analytic/title"/>.&quot;
            </xsl:if>
            <xsl:choose>
                <xsl:when test=".//title[@level='j'] or biblStruct[@type='journalArticle']">
                    <xsl:apply-templates select=".//title[@level='j']"/>,
                    <xsl:if test=".//biblScope[@type='vol']">
                        vol. <xsl:apply-templates select=".//biblScope[@type='vol']"/>,
                    </xsl:if>
                    <xsl:if test=".//biblScope[@type='pp'] or .//biblScope[@type='pages']">
                        pp. <xsl:apply-templates select=".//biblScope[@type='pp'], .//biblScope[@type='pages'] "/>.
                    </xsl:if>
                </xsl:when>
                <xsl:when test=".//title[@level='m'] or biblStruct[@type='monograph']">
                    <xsl:if test=".//editor">
                        In: <xsl:apply-templates select=".//editor"/>.
                    </xsl:if>
                    <xsl:if test=".//title[@level='m']">
                        <xsl:apply-templates select=".//title[@level='m']"/>.
                    </xsl:if>
                    <xsl:if test=".//pubPlace">
                        <xsl:apply-templates select=".//pubPlace"/>,
                    </xsl:if>
                    <xsl:if test=".//publisher">
                        <xsl:apply-templates select=".//publisher"/>,
                    </xsl:if>
                    <xsl:if test=".//biblScope[@type='vol']">
                        vol. <xsl:apply-templates select=".//biblScope[@type='vol']"/>,
                    </xsl:if>
                    <xsl:if test=".//biblScope[@type='pp'] or .//biblScope[@type='pages']">
                        pp. <xsl:apply-templates select=".//biblScope[@type='pp'], .//biblScope[@type='pages'] "/>.
                    </xsl:if>
                </xsl:when>
            </xsl:choose>
          </xsl:element>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <xsl:element name="span">
            <xsl:attribute name="class">bibl</xsl:attribute>
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
