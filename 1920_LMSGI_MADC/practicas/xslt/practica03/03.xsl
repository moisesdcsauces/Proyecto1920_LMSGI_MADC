<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="02.xsl"/>
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <title>XSLT 03 Moisés Alberto Domínguez Cruz</title>
                <link href="estilos.css" rel="stylesheet" type="text/css"/>
                <meta name="Author" content="Moisés Alberto Domínguez Cruz"/>
                <meta name="Description" content="xslt 3"/>
                <meta name="robots" content="index, follow"/>
            </head>
            <body>
                <h1>Informacion de las peliculas</h1>
                <xsl:apply-templates select="//pelicula">
                    <xsl:sort select="./publico" data-type="text" order="ascending"/>
                    <xsl:sort select="./valoracion/@puntos" data-type="number" order="descending"/>
                    <xsl:sort select="./nombre" data-type="text" order="descending"/>
                </xsl:apply-templates>
                <footer>
                    <p>Numero total de peliculas: <xsl:value-of select="count(//pelicula)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//pelicula">
        <div class="caja">
            <h3>
                <xsl:value-of select="nombre"/>
            </h3>
            <p>Puntuacion: <span>
                    <xsl:choose>
                        <xsl:when test=".//@puntos&lt;5">*** </xsl:when>
                        <xsl:when test=".//@puntos&lt;=7">*****</xsl:when>
                        <xsl:otherwise>*******</xsl:otherwise>
                    </xsl:choose>
                </span>
            </p>
            <p>Dirigida a <xsl:value-of select="./publico"/></p>
        </div>
    </xsl:template>

</xsl:stylesheet>