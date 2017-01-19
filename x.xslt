<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:strip-space elements="*" />
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="plants">
		<xsl:copy><xsl:apply-templates /></xsl:copy>
	</xsl:template>

	<xsl:template match="planet">
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="mass">
		<xsl:copy>
			<xsl:value-of select="." />
			<xsl:value-of select="@units" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
