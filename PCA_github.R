#ejercicio 1
grasslands.spe <- read.delim ('http://www.davidzeleny.net/anadat-r/data-download/grasslands-spe.txt', row.names = 1)
grasslands.env <- read.delim ('http://www.davidzeleny.net/anadat-r/data-download/grasslands-env.txt')

grasslands.spe.log <- log1p(grasslands.spe)

library (vegan)

PCA <- rda (grasslands.spe.log)  # if rda is used without explanatory variabels, it calculates PCA
PCA
head (summary (PCA))
plot(PCA)

#vegtype <- as.numeric (as.factor (grasslands.env$classification))
#ordiplot (PCA, display = 'sites', type = 'n')
#points (PCA, pch = vegtype, col = vegtype)

#Ejercicio 2

library(vegan)
library(ade4)
library(PerformanceAnalytics)
data("doubs")
env<-doubs$env

acp<-rda(env,scale=T)
summary(acp)
biplot(acp, scaling = 1)
#Scaling 1: Gráfico biplot de distancias. “Las distancias entre los objetos en el gráfico biplot son las aproximaciones de las distancias Euclideanas in un espacio multidimensional”, es decir, los ángulos entre los vectores NO reflejan sus correlaciones.
#Scaling 2: Gráfico de correlaciones. “Las distancias entre los objetos en el gráfico biplot NO son las aproximaciones de las distancias Euclideanas in un espacio multidimensional”, es decir, los ángulos entre los descriptores reflejan las correlaciones.

#Otra opcion de calcular PCA sin tener que usar paquete vegan
prin_comp <- prcomp(env, scale. = T)
biplot(prin_comp, scale = 0)
