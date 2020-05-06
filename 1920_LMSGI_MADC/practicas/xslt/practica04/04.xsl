<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <title>XSLT 04 Moisés Alberto Domínguez Cruz</title>
                <link href="estilos.css" rel="stylesheet" type="text/css"/>
                <meta name="Author" content="Moisés Alberto Domínguez Cruz"/>
                <meta name="Description" content="xslt 3"/>
                <meta name="robots" content="index, follow"/>
            </head>
			<body>
                <xsl:apply-templates select="actividades"/>
            </body>
		</html>
    </xsl:template>
	
	<xsl:template match="actividades">
    <article>
        <header>
            <h2>1. TODOS LOS ELEMENTOS DE LAS ACTIVIDADES INFANTILES.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN:  //actividad[@nivel="infantil"]</h3>
        </header>
            <xsl:for-each select="//actividad[@nivel='infantil']">
                <ul>
                    <li>Código: <xsl:value-of select="./codigo"/></li>
                    <li>Título: <xsl:value-of select="./titulo"/></li>
                    <li>Fecha de inicio: <xsl:value-of select="./fecha_inicio"/></li>
                    <li>Sesiones: <xsl:value-of select="./sesiones"/></li>
                </ul>
            </xsl:for-each>
    </article>
    <article>
        <header>
            <h2>2. EL NOMBRE DE LAS ACTIVIDADES PARA ADULTOS.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN: //actividad[@nivel="adultos"]/titulo</h3>
        </header>
            <xsl:for-each select="//actividad[@nivel='infantil']/titulo">
                <ul>
                    <li><xsl:value-of select="."/></li>
                </ul>
            </xsl:for-each>
    </article>
    <article>
        <header>
            <h2>3. EL NOMBRE DE LAS ACTIVIDADES DE ADULTOS.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN: //sesiones[sesiones_semana='2']/../titulo</h3>
        </header>
            <xsl:for-each select="//sesiones[sesiones_semana='2']/../titulo">
                <ul>
                    <li><xsl:value-of select="."/></li>
                </ul>
            </xsl:for-each>
    </article>
    <article>
        <header>
            <h2>4. CUENTA EL NÚMERO DE ACTIVIDADES.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN: count(//actividad)</h3>
        </header>
            <p>Número de actividades: <xsl:value-of select="count(//actividad)"/></p>
    </article>
    <article>
        <header>
            <h2>5. CUENTA EL NÚMERO DE ACTIVIDADES INFANTILES.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN: count(//actividad[@nivel='infantil'])</h3>
        </header>
            <p>Número de actividades infantiles: <xsl:value-of select="count(//actividad[@nivel='infantil'])"/></p>
    </article>
    <article>
        <header>
            <h2>6. CONVERTIR EL NÚMERO DE ACTIVIDADES A STRING.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN: string(count(//actividad))</h3>
        </header>
            <p>Número de actividades infantiles: <xsl:value-of select="string(count(//actividad))"/></p>
    </article>
    <article>
        <header>
            <h2>7. SUMA DE LAS SESIONES SEMANALES DE LAS ACTIVIDADES PARA ADULTOS.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN: sum(//actividad[@nivel='adultos']/sesiones/sesiones_semana)</h3>
        </header>
            <p>Suma de las sesiones semanales de las actividades para adultos: <xsl:value-of select="sum(//actividad[@nivel='adultos']/sesiones/sesiones_semana)"/></p>
    </article>
    <article>
        <header>
            <h2>8. NODOS DE LA ACTIVIDAD DE CÓDIGO A06.</h2>
        </header>
        <header>
            <h3>EXPRESIÓN: /actividades/actividad[./codigo='A06']/descendant::*"</h3>
        </header>
            <xsl:variable name="variable" select="/actividades/actividad[./codigo='A06']/descendant::*"/>
                <xsl:for-each select="$variable[not(name()='sesiones')]">
                    <p><xsl:value-of select="name(.)"/> : <xsl:value-of select="."/></p>
                </xsl:for-each>
    </article>
    </xsl:template>
</xsl:stylesheet>