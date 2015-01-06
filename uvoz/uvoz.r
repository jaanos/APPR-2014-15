# 2. faza: Uvoz podatkov

source("lib/xml.r")


# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozimoskihrbtno <- function() {
  mh <- read.csv2("podatki/moskihrbtno.csv", sep = ";",
                 fileEncoding = "Windows-1250")
  mh$Čas <- sapply(mh$Čas, cas.v.sekunde)
  return(mh)
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih na moski, 100 m, hrbtno ...\n")
moskihrbtno <- uvozimoskihrbtno()



# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozizenskehrbtno <- function() {
  zh <- read.csv2("podatki/moskihrbtno.csv", sep = ";",
                  fileEncoding = "Windows-1250")
  zh$Čas <- sapply(zh$Čas, cas.v.sekunde)
  return(zh)
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih zenske, 100 m, hrbtno ...\n")
zenskehrbtno <- uvozizenskehrbtno()

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozimoskiprsno <- function() {
  mp <- read.csv2("podatki/moskihrbtno.csv", sep = ";",
                  fileEncoding = "Windows-1250")
  mp$Čas <- sapply(mp$Čas, cas.v.sekunde)
  return(mp)
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih moski, 100 m, prsno ...\n")
moskiprsno <- uvozimoskiprsno()

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozizenskeprsno <- function() {
  zp <- read.csv2("podatki/moskihrbtno.csv", sep = ";",
                  fileEncoding = "Windows-1250")
  zp$Čas <- sapply(zp$Čas, cas.v.sekunde)
  return(zp)
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih zenske, 100 m, prsno ...\n")
zenskeprsno <- uvozizenskeprsno()

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozimoskidelfin <- function() {
  md <- read.csv2("podatki/moskihrbtno.csv", sep = ";",
                  fileEncoding = "Windows-1250")
  md$Čas <- sapply(md$Čas, cas.v.sekunde)
  return(md)
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih moski, 100 m, delfin ...\n")
moskidelfin <- uvozimoskidelfin()

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozizenskedelfin <- function() {
  zd <- read.csv2("podatki/moskihrbtno.csv", sep = ";",
                  fileEncoding = "Windows-1250")
  zd$Čas <- sapply(zd$Čas, cas.v.sekunde)
  return(zd)
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih zenske, 100 m, delfin ...\n")
zenskedelfin <- uvozizenskedelfin()

cat("Uvažam podatke o rekordih moski, 100 m, prosto ...\n")
moskiprosto <- uvozi.moskiprosto()

cat("Uvažam podatke o rekordih zenske, 100 m, prosto ...\n")
zenskeprosto <- uvozi.zenskeprosto()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.