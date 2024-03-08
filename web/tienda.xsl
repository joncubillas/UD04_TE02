<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Módulo: LMSGI
    UD: 04
    Fecha 08/03/2024
    Autor: Jon Cubillas
    Tarea: Tarea Evaluativa 02
    Enunciado: El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para transformar un sitio web de manera que obtenga los datos visualizados de un documento XML.

    1. Listado de los productos de la tienda: mostrará la imagen, el precio y los comentarios de todos los artículos. Además, indicará el número de comentarios que hay.
    2. Datos de un equipo: Mostrará el equipo entrenado por Julio Velasco.
    
    Se visualizará el nombre del entrenador, el nombre del equipo y los jugadores y jugadoras titulares con su número de camiseta.
    Al pulsar sobre el nombre del entrenador se abrirá un la página con su biografía. La URL también se obtendrá del XML
    Se deberá guardar el nombre del entrenador en una variable. De esta manera, si se modifica su nombre el resto de datos también se modificarán de forma automática en la página.

    3. Datos de partidos: Mostrará todos los partidos que se juegan en Lima, ordenados por fecha desde el más reciente.

    Visualizará los equipos, la fecha y el resultado
    Además, si gana el visitante lo mostrará en azul.


    El XSLT que muestra los datos de un equipo, solo usará plantillas y expresiones XPath adecuadas y no for-each.
    Para ello, partiendo del siguiente proyecto y del siguiente documento XML se pide generar los ficheros XSLT necesarios para que las siguientes páginas se muestren correctamente. Si se modifican los datos en el XML, el sitio web variará.

    El proyecto resultante se publicará en Internet, en GitHub o cualquier otro servicio de alojamiento público.
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" doctype-system="about:legacy-compat" />

<!-- Esta plantilla se aplica al elemento raíz del documento XML -->
<xsl:template match="/">
    <!-- Se crea el elemento html -->
    <html>
        <!-- Se crea el elemento head con el título de la página -->
        <head>
            <title>Club de voleibol</title>
            <!-- Se incluye el archivo CSS -->
            <link rel="stylesheet" type="text/css" href="../css/estilo.css" />

        </head>
        <!-- Se crea el elemento body con el contenido de la página -->
        <body>
            <!-- Se crea el header con el logotipo y los enlaces a las otras páginas -->
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            <!-- Se crea el main con el contenido principal de la página -->
            <main class="principal">
                <!-- Se aplica la plantilla que coincide con el elemento tienda -->
                <xsl:apply-templates select="club_voleibol/tienda"/>
            </main>
            <!-- Se crea el footer con la información del desarrollador -->
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>
<!-- Esta plantilla se aplica al elemento tienda -->
<xsl:template match="tienda">
    <!-- Se crea un artículo con la información de cada artículo de la tienda -->
    <xsl:for-each select="articulo">
        <article>
            <section>
                <!-- Se crea una imagen con el atributo foto del artículo -->
                <img class="articulo" src="/img/{@foto}"/>
            </section>
            <section>
                <!-- Se crea un encabezado con el precio del artículo -->
                <h2><xsl:value-of select="precio"/> €</h2>
                <!-- Se crea un encabezado con el número de comentarios del artículo -->
                <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                <!-- Se crea una lista con los comentarios del artículo -->
                <ul>
                    <xsl:for-each select="comentarios">
                        <li>
                            <!-- Se muestra la fecha y el texto del comentario -->
                            <xsl:value-of select="@fecha"/>: <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
            </section>
        </article>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>