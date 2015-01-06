# Uvoz s spletne strani

library(XML)

# Pretvori čas [oblika (m:)ss(.d(c))] v število sekund
cas.v.sekunde <- function(x) {
  parts <- as.numeric(unlist(strsplit(gsub("(\\.[0-9])$", "\\10",
                                           as.character(x)), "[:.]")))
  secs <- c(60, 1, 0.01)
  return(sum(parts * secs[(4-length(parts)):3]))
}

# Vrne vektor nizov z odstranjenimi začetnimi "prazninami" (whitespace)
# in iz vozlišč, ki ustrezajo podani poti. 
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1",
                                     gsub("^(.*?)\\[.*$", "\\1",
                                          xmlValue(y)))))
} 

uvozi.moskiprosto <- function() {
  url.moskiprosto <- "http://en.wikipedia.org/wiki/World_record_progression_100_metres_freestyle"
  doc.moskiprosto <- htmlTreeParse(url.moskiprosto, useInternalNodes=TRUE)
  
  # Pobrišemo nevidno vsebino
  for (t in getNodeSet(doc.moskiprosto, "//span[@style='display:none']|//span[@class='sortkey']")) {
    xmlValue(t) <- ""
  } 
  
  # Poiščemo vse tabele v dokumentu
  tabele <- getNodeSet(doc.moskiprosto, "//table")
  
  # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
  # trenutnim vozliščem
  vrstice <- getNodeSet(tabele[[1]], "./tr")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
  
  # Iz seznama vrstic naredimo matriko
  matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
  
  # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) tabele
  colnames(matrika) <- gsub("\n", " ", stripByPath(vrstice[[1]], ".//th"))
  
  # Minuse nadomestimo z NA
  matrika[matrika == "-"] <- NA
  
  # Podatke iz matrike spravimo v razpredelnico
  return(data.frame(Time = sapply(matrika[,"Time"], cas.v.sekunde),
                    matrika[,4:8]))
  
}

uvozi.zenskeprosto <- function() {
  url.zenskeprosto <- "http://en.wikipedia.org/wiki/World_record_progression_100_metres_freestyle"
  doc.zenskeprosto <- htmlTreeParse(url.zenskeprosto, useInternalNodes=TRUE)
  
  # Pobrišemo nevidno vsebino
  for (t in getNodeSet(doc.zenskeprosto, "//span[@style='display:none']|//span[@class='sortkey']")) {
    xmlValue(t) <- ""
  } 
  
  # Poiščemo vse tabele v dokumentu
  tabele <- getNodeSet(doc.zenskeprosto, "//table")
  
  # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
  # trenutnim vozliščem
  vrstice <- getNodeSet(tabele[[3]], "./tr")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
  
  # Iz seznama vrstic naredimo matriko
  matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
  
  # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) tabele
  colnames(matrika) <- gsub("\n", " ", stripByPath(vrstice[[1]], ".//th"))
  
  # Minuse nadomestimo z NA
  matrika[matrika == "-"] <- NA
  
  # Podatke iz matrike spravimo v razpredelnico
  return(data.frame(Time = sapply(matrika[,"Time"], cas.v.sekunde),
                    matrika[,4:8]))
  
}