<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 14 de abril de 2020, 9:08
    Author     : amor
    Description:
         Transformacion de 01.xml en una página HTML que contiene lista de alumnos
		 y su dirección.
		 Usando dos plantillas
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>  
	<xsl:template match="alumnos">
		<html>
			<head> 
				<title>01 XSLT- Información de alumnos</title>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
    
    <xsl:template match="alumno">
      <p> <xsl:value-of select="concat(nombre,' ', apellido)"/></p>
	  <p><xsl:value-of select="direccion/poblacion"/></p>
	  <p><xsl:value-of select="direccion/cp"/></p>
    </xsl:template>

</xsl:stylesheet>
