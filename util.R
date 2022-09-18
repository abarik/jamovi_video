library(rio)
library(MASS)
library(tidyverse)

kerdoiv <- survey
kerdoiv <- kerdoiv %>% rename(Nem=Sex, Pulzus=Pulse, Dohányzás=Smoke, "Testmagasság (cm)"=Height)
kerdoiv <- kerdoiv %>% rowwise() %>% mutate("Kézméret (cm)"=mean(c(Wr.Hnd,NW.Hnd)))
kerdoiv <- kerdoiv %>% select(Nem, Pulzus, Dohányzás, "Testmagasság (cm)", "Kézméret (cm)")
levels(kerdoiv$Nem) <- c("Nő", "Férfi")
levels(kerdoiv$Dohányzás) <- c("Erős", "Soha", "Alkalmi", "Rendszeres")

export(x = kerdoiv[1:10,], file = "adat/felmeres_1_10.xlsx")
export(x = kerdoiv, file = "adat/felmeres.xlsx")
