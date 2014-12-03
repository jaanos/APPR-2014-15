# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv

branje.podatkov <- function(){
  return(read.csv2("podatki/film.csv", skip=0, na.strings="-", 
                      fileEncoding="Windows-1250", col.names=c("mesto", "datum izida", "naslov filma", "Proracun", "Zasluzek v zda", "Zasluzek po svetu")))
}

M<-branje.podatkov()

#čiščenje podatkov
#odstranjevanje dolarja

M$Proracun<-gsub("[$,]", "",M$Proracun ,ignore.case=TRUE)
M$Zasluzek.v.zda<-gsub("[$,]", "",M$Zasluzek.v.zda, ignore.case=TRUE)
M$Zasluzek.po.svetu<-gsub("[$,]", "", M$Zasluzek.po.svetu, ignore.case=TRUE)

#branje stevilk

M$Proracun<-as.numeric(M$Proracun)
M$Zasluzek.v.zda<-as.numeric(M$Zasluzek.v.zda)
M$Zasluzek.po.svetu<-as.numeric(M$Zasluzek.po.svetu)

#razpredelnica iz interneta

library(XML)
naslov = "http://www.the-numbers.com/movies/franchises/"
doc <- htmlTreeParse(naslov, encoding = "UTF-8", useInternal = TRUE)
r<-xmlRoot(doc)
tables=readHTMLTable(naslov,as.data.frame = TRUE)

G<-data.frame(tables)
names(G)<-c("franšiza", "število.delov", "zaslužek.v.zda", "zaslužek.po.svetu")

#ciscenje razpredelni

G$zaslužek.v.zda<-gsub("[$,]", "",G$zaslužek.v.zda, ignore.case=TRUE)
G$zaslužek.po.svetu<-gsub("[$,]", "", G$zaslužek.po.svetu, ignore.case=TRUE)

G$zaslužek.v.zda<-as.numeric(G$zaslužek.v.zda)
G$zaslužek.po.svetu<-as.numeric(G$zaslužek.po.svetu)
G$število.delov<-as.numeric(G$število.delov)


