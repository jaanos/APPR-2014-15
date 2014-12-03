# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke geotimesexiscedvecmanj-csv.csv

branje.podatkov <- function(){
  return(read.csv2("podatki/film.csv", skip=0, na.strings="-", 
                      fileEncoding="Windows-1250", col.names=c("mesto", "datum izida", "naslov filma", "Proracun", "Zasluzek v zda", "Zasluzek po svetu")))
}

M<-branje.podatkov()

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

