<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:eg="http://www.tei-c.org/ns/Examples" 
    xmlns:xd="http://www.pnp-software.com/XSLTdoc" 
    xmlns:fn="http://www.w3.org/2005/xpath-functions" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="#all">

    <xd:doc type="stylesheet">
        <xd:short>
                EN: This file has been prepared for you to add your personal XSLT templates
                IT: Questo file è stato predisposto per accogliere template personalizzati
        </xd:short>
    </xd:doc>
    <!-- In order to make it work properly you need to add mode="interp dipl #default" to each template -->
    
    <!-- The following XSLT template are provided as an example to transform elements within the <titlePage> -->
    

   <!-- <xsl:template match="tei:del" mode="interp dipl #default">
        <div name="class" 
            select="@seq="
            separator="-">
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:apply-templates mode="#current"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:docAuthor" mode="interp dipl #default" priority="9">
        <div class="docImprint">
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:apply-templates mode="#current"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:docEdition" mode="interp dipl #default">
        <div class="docImprint">
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:apply-templates mode="#current"/>
        </div>
    </xsl:template>
-->
   <!-- <xsl:template match="tei:app" mode="dipl" priority="3">
        <xsl:element name="span">
            <xsl:attribute name="class" select="dipl, name()" separator="-"/>
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:apply-templates select="tei:lem" mode="#current"/>
            <xsl:apply-templates select="tei:rgd" mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:rgd" mode="dipl" priority="3">
        <xsl:element name="span">
            <xsl:attribute name="class" select="dipl, '#'" separator="-"/>
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:apply-templates  mode="#current"/>
        </xsl:element>
               
    </xsl:template>
    <xsl:template match="tei:lem" mode="dipl" priority="3">
        <xsl:element name="span">
            <xsl:attribute name="class" select="dipl, '#'" separator="-"/>
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:apply-templates  mode="#current"/>
        </xsl:element>
        
    </xsl:template>-->
    
    
    
   <!-- <xsl:template match="tei:div" mode="dipl">
        <xsl:element name="div">
            <xsl:attribute name="class" select="name ()"/>
            <xsl:call-template name="dataAttributesFromAttributes"/>
            <xsl:apply-templates mode="#current"> </xsl:apply-templates>
        </xsl:element>				
    </xsl:template>
    -->

    
   <!-- template per le strofe (GT)-->
    
   <!-- <xsl:template match="tei:lg" mode="dipl">
        
        <xsl:element name="div">
            <xsl:attribute name="class" select="name ()"/>
            <xsl:call-template name="dataAttributesFromAttributes"/>
           <xsl:choose> 
               <xsl:when test="tei:l/@n='1'">
                   
                   
                   <span class="strofa"></span><!-\-<sup class="quadrato"><xsl:value-of select="@n"/></sup>-\-><!-\-<xsl:text> </xsl:text>-\->
               
                           
           </xsl:when>
            <xsl:otherwise>
                
                
            </xsl:otherwise></xsl:choose> 
            <xsl:apply-templates mode="#current"/>
  
            
         
        </xsl:element>
    </xsl:template>-->
    
    
</xsl:stylesheet>
