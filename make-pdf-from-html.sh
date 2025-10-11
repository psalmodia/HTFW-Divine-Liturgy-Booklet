#!/bin/sh

# wkhtmltopdf -s Letter \
# --allow images \
# --zoom 1.3 \
# --margin-top 0.75in \
# --margin-bottom 1in \
# --margin-left 0.75in \
# --margin-right 0.75in \
# --footer-left 'Divine Liturgy Service Booklet (Choir)' \
# --footer-right '[page] of [toPage]' \
# --footer-font-name 'Open Sans' \
# --footer-font-size 10 \
# --footer-spacing 10 \
# Choir-Book-Divine-Liturgy-HTFW.html Choir-Book-Divine-Liturgy-HTFW.pdf
CSSFILE=user.css
cat > ${CSSFILE} <<EOF
@import url('https://fonts.googleapis.com/css2?family=Domine:wght@400..700&display=swap');
@font-face {
  font-family: 'Roboto';
  font-weight: 400;
  src: url('/usr/share/fonts/TTF/Roboto-Medium.ttf') format('ttf');
}
font-face {
  font-family: 'Roboto';
  font-weight: 700;
  src: url('/usr/share/fonts/TTF/Roboto-Medium.ttf') format('ttf');
}
body {
 font-family: Domine, Roboto, Verdana, Arial, sans-serif;
 font-size: 16px;
}
.figure p { text-align: left; }
@page {
size: letter;
margin: 1in;
}
h1, h2, h3, h4, h5 {
page-break-after: avoid;
}
@page:right{
@bottom-right {
content: counter(page);
}
}
@page:left{
@bottom-left {
content: counter(page);
}
}
EOF
weasyprint -v -s ${CSSFILE} \
Choir-Book-Divine-Liturgy-HTFW.html Choir-Book-Divine-Liturgy-HTFW.pdf
