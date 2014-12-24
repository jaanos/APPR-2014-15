#pita
pdf("slike/Natutral_gas_imprts_exports_2008.pdf")
slices<-c(sum(Proracuni$Proracun[1:200]), sum(Proracuni$Proracun[201:4000]))
lbls<-c("Najdražjih 200", "Od 201 do 4000")
pct<-round(slices/sum(slices)*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)),  main="Pita cen")
dev.off()

#stolpičast graf
pdf("Slike/Število delov serije.pdf")
barplot(xtabs(~Fransize$število.delov),space=F,col=rainbow(16),main="Število delov")
dev.off()