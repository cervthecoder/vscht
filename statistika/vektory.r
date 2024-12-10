########## tento skript je nasim uvodnim seznamenim s Rkem ##########
#####################################################################
# povsimnete si, ze v tomto softwaru jsou komentare opatreny (alespon jednim) dvojitym krizkem
# a nezapomente, ze eRko rozeznava velka a mala pismena

## prace s cisly probiha velice podobne jako na kalkulacce, akorat 
# symbol "krat" je *
# symbol "deleno" je /
# odmocnina ze dvou je sqrt(2)

### SAMI: vypoctete
###       a) 5 deleno 8
###       b) 3 krat 181
###       c) odmocnina ze tri

5/8
3*181
sqrt(3)

### ulozeni cisla do promenne: 
##############################
pocet<-30  ## to je pocet studentu zapsanych na pondelni cviceni

### vypsani hodnoty promenne na obrazovku:
##########################################
pocet

#pokud se prepiseme a udelame preklep (kterym je i velke pismeno):
#pocet     ## bude zahlasena chyba. Nezna promennou pocet

### SAMI: a) do promenne VEK ulozte svuj vek (v rocich)
###       b) vypiste promennou VEK

VEK<-20
VEK

### prace s promennymi... jako by to byla konkretni cisla
#########################################################

XX<-13   ## pocet devcat na cvicenich
XY<-17   ## pocet kluku na cvicenich

XX+XY    ## (by se melo rovnat "poctu")

### SAMI: a) vytvorte promennou NOVA a dosadte do ni podil promennych XX a XY
NOVA<-XY/XX
###       b) vypiste promennou NOVA 
NOVA
###       c) spoctete rozdil mezi promennymi pocet a NOVA
pocet-NOVA

######## dalsi dulezita vec pro nas bude prace s vektory ########
#################################################################

### vektor zadany primo
#######################

hele <- c(1, 5, 4, 9, 0)
length(hele)                ## funkce, vypise pocet souradnic (dimenzi, delku) vektoru hele

delka<-length(hele)         ## i funkcni hodnota muze byt ulozena do promenne        
delka

### vektor zadany operatorem (muze se hodit)
############################################

x <- 1:7
x

y <- 2:-2
y
### vektor jako konecna posloupnost (i to se hodi)
##################################################

seq(1, 3, by=0.2)          # urcen pocatkem, koncem a velikosti kroku
seq(1, 5, length.out=4)    # urcen                  a poctem prvku (slozek)

### SAMI: a) vytvorte vektor VEKT_1 s prvky -1,0,0.25,11
VEKT_1<-c(-1,0,0.25,11)
###       b) vytvorte vektor VEKT_2 jehoz prvky jsou cisla -2,-1,...22,23
VEKT_2<-seq(-2,23)
###       c) kolik prvku ma VEKT_2?
length(VEKT_2)

### prace s prvky vektoru
#########################

x<-c(0,2,4,6,8,10)
x[3]           # vypise 3. prvek

x[c(2, 4)]     # vypise 2. a 4. prvek
x[2:4]         # vypise 2. az 4. prvek
y<-x[c(2,4)]    # vytvori vektor z 2. a 4. prvku vektoru x
y

x[-1]          # vsechny prvky krome 1.
y<-x[-1]       # vektor, ktery vznikne z x vynechanim 1. prvku
y

#x[c(2, -4)]    # zahlasi chybu, pozice prvku jsou kladna cisla
x[c(2.4, 3.54)]    # "zaokrouhli" (Rko uvazuje tzv. dolni celou cast, tj. x[c(2,3)]) 

### SAMI:    uvazujte svuj vektor VEKT_2:
###       a) vypiste 10. prvek
VEKT_2[10]
###       b) sectete 13. a 18. prvek
VEKT_2[13]+VEKT_2[18]
###       c) vydelte 20. prvek prvkem 6.
VEKT_2[20]/VEKT_2[6]
###       d) do vektoru VEKT_3 ulozte 3.,11., 13. a 20. prvek vektoru VEKT_2
VEKT_3<-c(VEKT_2[3],VEKT_2[11],VEKT_2[13],VEKT_2[20])

### uprava vektoru
##################

x[2]<- -10     # prepise druhou souradnici

x[-c(2,4)]     # vypise vsechny prvky vektoru x BEZ 2. a 4. prvku
x<-x[-c(2,4)]  # PRIMO z promene x vymaze druhy a ctvrty prvek
length(x)
x
x<-NULL        # vymaze "vnitrek" promenne x

### SAMI: a) z vektoru VEKT_2 vytvorte VEKT_4 odebranim 3., 10., a 14. prvku
VEKT_4<-VEKT_2[-c(3,10,14)]
###       b) jaka je dimenze vektoru VEKT_4?
length(VEKT_4)


### operace s vektory
x<-c(0,2,4,6,8,10)
y<-c(-3,-2,-1,0,1,2)

x+y     ## soucet po souradnicich
x*y     ## soucin po souradnicich

x-y     ## rozdil po souradnicich
x/y     ## podil po souradnicich, pozor na deleni nulou!!!!

### funkce na vektorech
#######################

length(x)   ## pocet prvku vektoru x (uz jsme si ukazali)
sum(x)      ## soucet prvku vektoru x
mean(x)     ## prumer z hodnot ulozenych v x

### spojeni vektoru
###################
novy_vektor<-c(x,y)      ## spoji vektory x a y do jednoho 
novy_vektor2<-c(novy_vektor,x)  ## vytvori vektor obsahujici prvky vektoru 
                         ## novy_vektor a x

### SAMI: a) vytvorte vektor VEKT_5 spojenim vektoru y a novy_vektor
VEKT_5<-c(y,novy_vektor)
###       b) urcete pocet prvku VEKT_5
length(VEKT_5)
###       c) soucet prvku vektoru VEKT_5 a jejich prumer
sum(VEKT_5)
mean(VEKT_5)

