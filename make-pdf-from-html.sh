#!/bin/sh

wkhtmltopdf -s Letter \
--allow images \
--zoom 1.3 \
--margin-top 0.75in \
--margin-bottom 1in \
--margin-left 0.75in \
--margin-right 0.75in \
--footer-left 'Divine Liturgy Service Booklet (Choir)' \
--footer-right '[page] of [toPage]' \
--footer-font-name 'Open Sans' \
--footer-font-size 10 \
--footer-spacing 10 \
Choir-Book-Divine-Liturgy-HTFW.html Choir-Book-Divine-Liturgy-HTFW.pdf
