<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	
	<xsl:template match="/listatickets">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="es">
			<head>
				<title>02 XSLT Moisés Alberto Domínguez Cruz</title>
				<link href="estilo.css" rel="stylesheet" type="text/css"/>
				<meta charset="utf-8"/>
				<meta name="Author" content="Moisés"/>
				<meta name="Description" content="Practica 2 de xslt"/>
				<meta name="robots" content="index, follow"/>
			</head>
			<body>
				<h1>Informacion de tickets</h1>
				<h2>Listado de tickets</h2>
				<xsl:for-each select="ticket">
					<xsl:sort select="numero" data-type="number" order="ascending"/>
					<h3>Ticket nº <xsl:value-of select="./numero"/></h3>
					<table>
						<caption>fecha del ticket: <xsl:value-of select="./fecha"/></caption>
						<thead>
							<tr>
								<th>Producto</th>
								<th>Precio</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="producto">
								<xsl:sort select="nombre" data-type="text" order="ascending" />
								<tr>
									<td>
										<xsl:value-of select="./nombre"/>
									</td>
									<td>
										<xsl:value-of select="./precio"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
						<tfoot>
							<tr>
								<td>Total</td>
								<td> 
									<xsl:value-of select="sum(./producto/precio)"/> 
								</td>
							</tr>
						</tfoot>
					</table>
				</xsl:for-each>
				<footer>
					<p>Numero total de tickets: <xsl:value-of select="count(//ticket)"/></p>
					<p>Total de tickets: <xsl:value-of select="sum(//precio)"/></p>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>