# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv
branje.csv<-function(){
  M<-read.csv2("podatki/film.csv", skip=0, na.strings="-", 
          fileEncoding="Windows-1250", col.names=c("mesto", "datum izida", "naslov filma", "Proracun", "Zasluzek v zda", "Zasluzek po svetu"))

  #čiščenje podatkov
  #odstranjevanje dolarja
  M$Proracun<-gsub("[$,]", "",M$Proracun ,ignore.case=TRUE)
  M$Zasluzek.v.zda<-gsub("[$,]", "",M$Zasluzek.v.zda, ignore.case=TRUE)
  M$Zasluzek.po.svetu<-gsub("[$,]", "", M$Zasluzek.po.svetu, ignore.case=TRUE)
  #branje stevilk
  M$Proracun<-as.numeric(M$Proracun)
  M$Zasluzek.v.zda<-as.numeric(M$Zasluzek.v.zda)
  M$Zasluzek.po.svetu<-as.numeric(M$Zasluzek.po.svetu)
  return(M)
}

#razpredelnica iz interneta
branje.xml<-function(){
  library(XML)
    naslov = "http://www.the-numbers.com/movies/franchises/"
  doc <- htmlTreeParse(naslov, encoding = "UTF-8", useInternal = TRUE)
  tables=readHTMLTable(naslov,as.data.frame = TRUE)
  G<-data.frame(tables)
  names(G)<-c("franšiza", "število.delov", "zaslužek.v.zda", "zaslužek.po.svetu")

  #ciscenje razpredelni

  G$zaslužek.v.zda<-gsub("[$,]", "",G$zaslužek.v.zda, ignore.case=TRUE)
  G$zaslužek.po.svetu<-gsub("[$,]", "", G$zaslužek.po.svetu, ignore.case=TRUE)
  G$zaslužek.v.zda<-as.numeric(G$zaslužek.v.zda)
  G$zaslužek.po.svetu<-as.numeric(G$zaslužek.po.svetu)
  #G$število.delov<-as.integer(G$število.delov)
  return(G)
}

Fransize<-branje.xml()
Proracuni<-branje.csv()

#pita
pdf("slike/Natutral_gas_imprts_exports_2008.pdf")
slices<-c(sum(Proracuni$Proracun[1:200]), sum(Proracuni$Proracun[201:4000]))
lbls<-c("Najdra�jih 200", "Od 201 do 4000")
pct<-round(slices/sum(slices)*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)),  main="Pita cen")
dev.off()

#stolpi�ast graf
pdf("Slike/�tevilo delov serije.pdf")
barplot(xtabs(~Fransize$�tevilo.delov),space=F,col=rainbow(16),main="�tevilo delov")
dev.off()
