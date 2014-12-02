branje.podatkov <- function(h){
  return(M<-read.csv2("podatki/film.csv", skip=0, na.strings="-", 
                      fileEncoding="Windows-1250", col.names=c("mesto", "datum izida", "naslov filma", "Proracun", "Zasluzek v zda", "Zasluzek po svetu")))
}

filmi<-branje.podatkov(h)


