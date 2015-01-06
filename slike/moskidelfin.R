rekordi <- table(gsub("(.*), (.*)", "\\2", moskidelfin$Kraj.prvenstva))

pdf("slike/moskidelfin.pdf") #naslov pdfja
pie(rekordi, cex = 0.5, main = "Moški delfin: Države doseženih rekordov")

dev.off()
