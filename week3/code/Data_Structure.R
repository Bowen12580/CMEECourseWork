# import R
R

a <-5
is.vector(a )

v1<- c(0.02,0.5,1)
v2<- c('a','bc','def','ghij',"hello")
v3<- c(TRUE,TRUE,FALSE)
v1 ;v2 ;v3

v1 <- c(0.02,TRUE,1)
v1

v1 <- c(0.02, 'Mary', 1)
v1

v2 <- character(3)
v2

v3 <- numeric(3) # an empty numeric 'character' with 3 elements
v3

print(character(4))

mat1 <- matrix(1:25, 5,5)
mat1(1,3)

mat2<- matrix(c(1,2,3,4,5,6),nrow=3, ncol=2,byrow=TRUE)
mat2

nrow(mat2)
dim(mat2)

print(t(mat2))

arr1 <- array(1:50, c(5,5,2))
arr1[,,1]
print(arr1)
arr1[,,2]
arr1[,,1]

mat1[1,1]<- 'one'
mat1

MyList <- list(1L, "p", FALSE, .001) # an integer, a character, a boolean, and a numeric walk into a bar...
MyList

MyList <- list(species=c("Quercus robur","Fraxinus excelsior"), age=c(123, 84))
MyList

MyList[[1]]
MyList[[1]][1]
MyList$species
MyList[["species"]]
MyList$species[1]

pop1<-list(species='Cancer magister',
           latitude=48.3,longitude=-123.1,
           startyr=1980,endyr=1985,
           pop=c(303,402,101,607,802,35))
pop1

pop1<-list(lat=19,long=57,
           pop=c(100,101,99))
pop2<-list(lat=56,long=-120,
           pop=c(1,4,7,7,2,1,2))
pop3<-list(lat=32,long=-10,
           pop=c(12,11,2,1,14))
pops<-list(sp1=pop1,sp2=pop2,sp3=pop3)
pops

pops$sp1

pops$sp1["pop"] # sp1's population sizes

pops[[2]]$lat #latitude of second species

pops[[3]]$pop[3]<-102 #change population of third species at third time step
pops

Col1 <- 1:10
Col1

Col2 <- LETTERS[1:10]
Col2

Col3 <- runif(10) # 10 random numbers from a uniform distribution
Col3

print((sum(Col3))/length(Col3))

MyDF <- data.frame(Col1, Col2, Col3)
MyDF

mode(MyDF)

names(MyDF) <- c("MyFirstColumn", "My Second Column", "My.Third.Column")
MyDF
MyDF$MyFirstColumn
colnames(MyDF)
MyDF$My.Third.Column
colnames(MyDF)[2] <- 'MySecondColumn'
MyDF
MyDF[,1]

MyDF[1,1]

MyDF[1,]

MyDF[c("MyFirstColumn","My.Third.Column")] # show two specific columns only

class(MyDF)
mode(MyDF)
str(MyDF)
head(MyDF)
tail(MyDF)
MyMat = matrix(1:8, 4, 4)
MyMat

MyDF = as.data.frame(MyMat)
MyDF

object.size(MyMat) # returns size of an R object (variable) in bytes
object.size(MyDF)