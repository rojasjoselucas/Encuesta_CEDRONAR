
#### Cargar todo lo necesario para el analisis----
install.packages("pacman")
library(pacman) # recordar si no esta instalado instalarlo antes

# La funcion p_load verifica si no esta instalado primero lo instala y luego ya lo carga el pkg en un solo paso
pacman::p_load(
    rio,        # importación/exportación de múltiples tipos de datos
    here,       # ruta relativa de los archivos
    janitor,    # limpieza de datos y tablas
    lubridate,  # trabajar con fechas
    epikit,     # función age_categories()
    tidyverse,  # gestión y visualización de datos
    matchmaker,
    corrplot#
    
  )

# Importamos labase de datos
base_cruda <- import( here("datos","base_usuario_encoprac2022.xlsx")) #cargamos la base cruda
base_cruda
str(base_cruda) # vemos como esta compuesta la base de datos

str (clean_names(base_cruda))

# Graficando de cat de consumo de alcohol por cat de edad

ggplot(data = subset( base_cruda, !is.na(AL_05)), # con subset sacamos los NA de la base de datos
       aes( x = GRUPO_EDAD_SEL, fill = as.factor(AL_05))) + 
  geom_bar(stat = "count")


