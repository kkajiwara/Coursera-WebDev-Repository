<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xlink="http://www.w3.org/1999/xlink">
<!-- Page template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Book using BITS</title>
      </head>
      <body style="font-family:Arial;">
          <xsl:apply-templates/>
          <div class="my-5 text-center footer">The end</div>
      </body>
    </html>
  </xsl:template>
<!-- Book template -->
    <xsl:template match="book">
    <!-- Sticky top -->
        <div class="container sticky-top bg-white pt-1">
        <!-- Title and Author -->
          <div class="title text-center mt-3"><xsl:apply-templates select="book-meta/book-title-group"/></div>
          <div class="contrib text-center mb-2"><xsl:text>by </xsl:text>
              <xsl:apply-templates select="book-meta/contrib-group/contrib"/>
          </div>
          <p class="col-1 text-left"><a href="#toc_rule" class="text-success">Contents</a></p>
        <!-- Line break -->
        <hr style="color:blue;border-width:4px;"/>
        </div>
    <!-- Scrolling div -->
        <div class="container">
        <!-- Cover image and Notes -->
        <div class="row justify-content-center align-items-center">
            <div class="col col-sm-auto" style="height:520px;text-align:center;">
                <xsl:apply-templates select="book-meta/notes/graphic"/>
            </div>
            <div class="col col-md-auto" style="text-align:center;">
                <xsl:for-each select="book-meta/notes/p">
                    <p class="my-0"><xsl:value-of select="."/></p>
                </xsl:for-each>
            </div>
        </div>
        <!-- Line break -->
        <hr id="toc_rule" style="color:blue;border-width:4px;margin-top:0;margin-bottom:20px"/>
        <!-- TOC with background -->
        <div class="toc container bg-warning-subtle p-3" style="width:50%;margin-top:10rem;">
            <h3 id="toc" class="text-center mb-3 pt-2">
                <xsl:apply-templates select="front-matter/toc/toc-title-group/title"/>
            </h3>
            <xsl:apply-templates select="front-matter/toc/toc-entry"/>
        </div>
        <!-- Book body chapters -->
        <div class="container" style="width:70%">
            <xsl:for-each select="book-body/book-part">
        <!-- Chapter title -->
                <xsl:apply-templates select="."/>
        <!-- Chapter box instructions and Next/Previous links. -->
                <div class="row">
                    <p class="col-8 text-primary mb-1">Click and scroll in the box to read the entire chapter.</p>
                        <p class="col-2 text-right mb-1">
                            <xsl:if test="position()!=1">
                                <a class="link-success">
                                    <xsl:attribute name="href">#tc<xsl:value-of select="position()-1"/></xsl:attribute>
                                    Prev chapter</a>
                            </xsl:if>
                        </p>
                        <p class="col-2 text-right mb-1">
                            <xsl:if test="position()!=last()">
                                <a class="link-success">
                                    <xsl:attribute name="href">#tc<xsl:value-of select="position()+1"/></xsl:attribute>
                                    Next chapter</a>
                            </xsl:if>
                        </p>
                </div>
        <!-- Chapter text -->
                <div class="py-3 border text-holder">
                    <xsl:for-each select="body/p">
                        <p class="mx-5"><xsl:value-of select="."/></p>
                    </xsl:for-each>
                </div>
          </xsl:for-each>
        </div>
        </div>
    </xsl:template>

<!-- Title template -->
    <xsl:template match="book-meta/book-title-group">
        <h1><xsl:value-of select="book-title"/></h1>
        <h4><xsl:value-of select="subtitle"/></h4>
    </xsl:template>
<!-- Author name template -->
    <xsl:template match="book-meta/contrib-group/contrib">
        <xsl:value-of select="name/given-names"/><xsl:text> </xsl:text>
        <xsl:value-of select="name/surname"/>
    </xsl:template>
<!-- Graphic template -->
    <xsl:template match="book-meta/notes/graphic">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="@xlink:href"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="alt-text"/>
            </xsl:attribute>
            <xsl:attribute name="height">500</xsl:attribute>
        </img>
    </xsl:template>
<!-- TOC entries template -->
    <xsl:template match="front-matter/toc/toc-entry">
        <p>
            <xsl:attribute name="class">text-left py-0 my-0</xsl:attribute>
            <a>
                <xsl:attribute name="href">#<xsl:value-of select="nav-pointer/@rid"/></xsl:attribute>
                <xsl:value-of select="title"/>
            </a>
        </p>
    </xsl:template>
<!-- Chapter title template -->
    <xsl:template match="book-body/book-part">
        <hr>
            <xsl:attribute name="class">chapter-hr</xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
        </hr>
        <h5>
            <xsl:attribute name="class">text-center mt-5 mb-3</xsl:attribute>
            <xsl:value-of select="book-part-meta/title-group/title"/>
        </h5>
        <p>
            <xsl:attribute name="class">col-2 text-right mb-1</xsl:attribute>
        </p>
    </xsl:template>

</xsl:stylesheet>
