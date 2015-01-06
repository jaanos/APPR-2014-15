pdf("slike/zenskehrbtno.pdf") #naslov pdfja
pie(table(zenskehrbtno[,"Ime"]), main = "Ženske hrbtno", cex.main = 1.5, cex=0.8)
#text(0,1,"Ženske hrbtno", cex =2) (ne rabim)
dev.off()