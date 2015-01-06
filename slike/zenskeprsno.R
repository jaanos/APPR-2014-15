pdf("slike/zenskeprsno.pdf") #naslov pdfja
pie(table(zenskeprsno[,"Državljanstvo"]), main = "Ženske prsno: države rekorderjev", cex.main = 1.5, cex=0.8)
dev.off()