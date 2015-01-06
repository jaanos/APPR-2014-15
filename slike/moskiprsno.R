pdf("slike/moskiprsno.pdf") #naslov pdfja
pie(table(moskiprsno[,"Državljanstvo"]), main = "Moški prsno: države rekorderjev", cex.main = 1.5, cex=0.8)
dev.off()