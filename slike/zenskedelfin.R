rekordi <- table(gsub("(.*), (.*)", "\\2", zenskedelfin$Kraj.prvenstva))

pdf("slike/zenskedelfin.pdf") #naslov pdfja
pie(rekordi, cex = 0.5, main = "Ženske delfin: Države doseženih rekordov")
dev.off()