<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0" xmlns:external="http://xsltfunctions.isam.ibm.com">

<!--
	This is a template stylesheet which should be used as a guide when
	using WebSEAL's HTTP Transformation engine. This sample is relevant to
	a request only.
-->

	<!-- Firstly, strip any space elements -->
	<xsl:strip-space elements="*" />

	<!--
		Perform a match on the root of the document. Output the required
		HTTPRequestChange elements and then process templates.
	-->
	<xsl:template match="/">
		<HTTPRequestChange>
			<xsl:apply-templates />

			<!--  Perform Object Name processing here. Output should be in the form
				<ObjectName>VALUE</ObjectName>
			if required. -->

			<!--  Set the ACL bits which are to be used in the
                              authorization decision.  Output should be in the 
                              form
				<AclBits>r</AclBits>
			if required. -->

		</HTTPRequestChange>
	</xsl:template>

	<!--
		Match on the Method. Any Method processing should happen within this
		template.
	-->
	<xsl:template match="//HTTPRequest/RequestLine/Method">
		<!-- Process the Method here. Output should be in the form 
			<Method>METHOD</Method>
		if required. -->
	</xsl:template>

	<!--
		Match on the URI. Any URI processing should happen within this
		template.
	-->
	<xsl:template match="//HTTPRequest/RequestLine/URI">
		<!-- Process the URI here. Output should be in the form 
			<URI>URI</URI>
		if required. -->
	</xsl:template>

	<!--
		Match on the Version. Any Version processing should happen within this
		template.
	-->
	<xsl:template match="//HTTPRequest/RequestLine/Version">
		<!-- Process the Version here. Output should be in the form 
			<Version>VERSION</Version>
		if required. -->
	</xsl:template>

	<!--
		Match on the Headers. Any Header processing should happen within this
		template.
	-->



	<xsl:template match="//HTTPRequest/Headers">
		<!--  Perform Header processing here. Output should be in the form
			<Header name="NAME" action="add|update|remove">VALUE</Header>
		if required. -->
	<xsl:variable name="langpref" select="//HTTPRequest/Cookies/Cookie[@name='LangPref']/node()" />
        <Header action="update" name="accept-language"><xsl:value-of select="$langpref" /></Header>
		
	</xsl:template>

	
	<!--
		Match on the Cookies. Any Cookie processing should happen within this
		template.
	-->
	<xsl:template match="//HTTPRequest/Cookies">
		<!--  Perform Cookie processing here. Output should be in the form
			<Cookie name="NAME" action="add|update|remove">VALUE</Cookie>
		if required. -->
	</xsl:template>

	<!--
		Match the request scheme.  Any processing should happen within
		this template.
	-->
        <xsl:template match="//HTTPRequest/Scheme">
		<!--  This is a variable that indicates whether the request was http or https. -->
	</xsl:template>
</xsl:stylesheet>