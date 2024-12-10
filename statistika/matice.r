####### dnes se budeme venovat maticim, ty spolu s vektory pro nas budou neuzitecnejsi ########

### jak zadefinovat matici?
###########################

# 1. "na hulvata"
#################

# vytvorime matici s prvky 0, 2, -1, 3, 10, 0.5 o 2 radcich (parametr nrow)
# a 3 sloupcich (parametr ncol)

matrix(c(0,2,-1,3,10,0.5), nrow = 2, ncol = 3)  ## povsimnete si, ze vektor (0, 2, -1, 3, 10, 0.5)
                                                ## se do matice ulozi "sloupcove"

matrix(c(0,2,-1,3,10,0.5), nrow = 2, ncol = 3, byrow=TRUE)     ## nefunguje, musime mit ta cisla skutecne jako vektor

## neni treba zadavat oba parametry ncol a nrow, eRko se "dopocita":

matrix(1:12, nrow = 4) 
matrix(1:12, ncol = 3)  ## jak vidime, vede to k tez matici, usporadava prvky
                        ##  1..12 do sloupcu

## chceme-li ukladat data "po radcich":
matrix(c(0,2,-1,3,10,0.5), nrow = 2, ncol = 3, byrow=TRUE)

# 2. z vektoru 
##############

u<-1:20               ## rekneme treba z tohoto vektoru u
matrix(u, ncol = 5)   ## tohle projde snadno, vektor u ma 20 prvku, cili matice
                      ## ma 4 radky

## ale co kdyz nam to nevyjde?
matrix(u, ncol =6)    ## jak vidime, vektor u se "replikuje" tak, aby naplnil
                      ## matici, ktera obsahuje vektor u jednou cely, a pak
                      ## uz zopakuje na doplneni matice


# 3. "rozsekanim vektoru"
#########################

dim(u)<- c(4,5)       ## dimenze objektu u je nyni 4 radky a 5 sloupcu, tim se 
                      ## zmeni typ u z vektoru na matici:
u                     ## opet do te matice naladuje hodnoty sloupcove

## chceme-li vytvorit promenou typu matice, delame to stejne jako u vektoru
MATICE<- matrix(c(1,-5,6,4,5, 10), ncol=3)
MATICE


### SAMI: vytvorte matici (jmeno nechame na Vas) o 3 radcich
###       obsahujici (po radcich) cisla: 1:24
########################################################################
matice123<- matrix(1:24, nrow=3, byrow=TRUE)
matice123
vektor<-1:24
dim(vektor)<-c(8,3)
vektor<-t(vektor)
vektor



## prace s prvky/sloupci/ radky matice

matice1<-matrix(1:16, nrow=4, byrow=TRUE)  ## vytvorime si nejakou matici
matice1
matice1[2,4]              ## prvek na pozici (2,4)
matice1[,2]               ## 2. sloupec matice
matice1[3,]               ## 3. radek matice
                          ## chceme-li tedy prvek "mimo" matici, stezuje si - neumi

### SAMI: a) vypiste prvek ve 3. radku a 1. sloupci matice1
###       b) 1. sloupec matice1
###       c) 4. radek matice1

matice1[3, 1]
matice1[, 1]
matice1[4, ]


matice1[3,4]<- -2   ## prvek na pozici 3. radku a 4. sloupce 
                    ## nahradime hodnotou -2

### SAMI: a) vytvorte matici jmenem SROUBEK typu 2x3
###          s prvky (po radcich): 3,0,-1.2,0.55,4,-7
###       b) prvek na pozici [1,3] v matici SROUBEK nahradte cislem 8

SROUBEK<-matrix(c(3, 0, -1.2, 0.55, 4, -7), nrow=2, byrow=TRUE)
SROUBEK[1,3]<-8


## matici si muzeme vytvorit i prazdnou:
maticka<-matrix(nrow=5, ncol=9)
maticka             ## nezadame-li matici, vytvori matici "prazdnou", 
                    ## ale danych rozmeru

maticka[1,]<-1:9    ## a dosazovat do ni postupne, jak potrebujeme

maticka[2,c(1,7)]   ## vektor obsahujici 1. a 7. prvek z 2. radku
maticka[c(1,3,5),3] ## vektor obsahujici 1., 3. a 5. prvek z 3. sloupce
maticka2<-maticka[c(1,2),c(4,6)]
maticka2

### SAMI:  vytvorte vektor VEK a do nej ulozte 1. a 3. prvek 
###        druheho radku matice SROUBEK

VEK<-SROUBEK[2, c(1,3)]
         

## pridani radku/sloupce do matice
maticka<-cbind(maticka,1:5)  ## pridame sloupec na konec matice
maticka

maticka<-rbind(-5:4,maticka) ## pridame radek na zacatek matice
maticka

## odstranovani radku a sloupcu matice, vytvareni "podmatic"

maticka<-maticka[-1,]  ## odstrani 1. radek z matice maticka
maticka1<-maticka[,-3] ## do maticka1 ulozi maticku krome 3. sloupce
maticka1
maticka3<-maticka[-c(4,5),-c(1,2)]  ## odstrani 4., 5. radek a 1., 2. sloupec z matice maticka
maticka3

### SAMI: a) z matice SROUBEK odstrante 2. sloupec a pak 1. radek
###       b) do Vasi matice SROUBEK pridejte na zacatek radek samych 2
###	      c) do vasi matice SROUBEK pridejte nakonec sloupec (-1,0)


SROUBEK
dim(SROUBEK)
SROUBEK<-SROUBEK[, -2]
dim(SROUBEK)
SROUBEK
SROUBEK<-SROUBEK[-1,]
dim(SROUBEK)
SROUBEK
SROUBEK<-rbind(c(2,2), SROUBEK)
SROUBEK
SROUBEK<-cbind(SROUBEK,c(-1,0))
SROUBEK


### ted uz mame zakladni praci se vsemi nejbeznejsimi strukturami definovanou 
### a priste zacneme pracovat s daty



######################## NECO Z LINEARNI ALGEBRY ###################
####################################################################
B<-matrix(c(1,0,1,0,1,-1,1,2,2),ncol=3,nrow=3) 
A<-matrix(c(6,7,1,0,1,-1,0,-2,3),ncol=3,nrow=3) 
det(B)   ## spocte determinant B
t(B)     ## transponovana matice
solve(B) ## inverzni matrice (pro B regularni)

A%*%B    ## maticove nasobeni
A*B      ## vynasobi jen prvky ve stejnych radcich a sloupcich
solve(B,c(1,1,1))  ## vyresi soustavu s pravou stranou c(1,1,1)
                   ## a matici soustavy B                   
                   ## POUZE pro regularni matice 
                   ## (resp. singularni matice se exaktni reseni hleda problematicky)
solve(B,c(0,0,0))  ## vyresi homogenni soustavu
eigen(B)           ## nalezne vlastni cisla a vypise sloupcove!! znormovane vlastni vektory
               

library(Matrix)    ## chceme-li si spocitat hodnost matice, je treba teto knihovny
rankMatrix(B)      ## mimojine vypise hodnost matice (rank)


################################################################
########################### DODATEK ############################ 

## pole (to znamena struktura radek x sloupce, 
## jako je matice, ale obecne n-rozmerna zalezitost

#vytvorime takto (pomoci vektoru u=(1,...,40)):
u<-1:40
pole<-array(u,c(2,5,4))  ## pole o rozmeru 2x5x4
pole                     ## vypsat ho na dvourozmernou obrazovku je trochu tezke ;-) cisla 
