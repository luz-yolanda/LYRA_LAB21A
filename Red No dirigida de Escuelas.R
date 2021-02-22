
# Hecho con gusto por LUZ YOLANDA RIVERA ALVAREZ

# LABORATORIO - RED NO DIRIGIDA DE ESCUELAS 

# Objetivo: A TRAVÉS DE LA COOCURRENCIA ENTRE ESCUELAS ENCONTRAR LA MATRIZ DE ADYACENCIAS DE LA RED NO DIRIGIDA DE ESCUELAS
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. generar una matriz apartir de una base de datos de escuelas y personal como habilidades para comparar los nodos.
# 2. Calcular coocurrencias entre escuelas CENDIS Zona 1
# 3. Estimar la matriz de adyacencias de la red no dirigida
# 4. Graficar
# 5. Guardar archivo en formato csv para graficar en charticulator


library (EconGeo)

# Encontrar el archivo
file.choose()

#nombramos M a nuestra matriz e indicamos el encabezado y los nombres de la primer columna
M = as.matrix(
  read.csv("/Users/luz/Documents/Doctorado/Materias/Complejidad Económica/Entregables /Semana 5/Laboratorio/Lab 21/Escuelas_Personal.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
#Revisamos el encabezado de nuestra matriz
head(M)

# co-ocurrencia entre escuelas en capacidades (capital humano contratado), es una red no dirigida
#la nombro matriz de adyacencias de una red no dirigida
MA=co.occurrence(M)

#llamamos a la librería para graficar
library (igraph)
g1= graph_from_adjacency_matrix(MA, mode = "undirected")

#graficamos
plot(g1)
library(EconGeo)


#transformar matriz de adyacencia en data frame para graficar
El= get.list(MA)
colnames(El)= c("Customer", "Product", "Count")
#lista de aristas
El

write.csv(El, file = "aristas escuelas.csv")





