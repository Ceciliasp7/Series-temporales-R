data("AirPassengers")
# Graficar la serie temporal
plot(AirPassengers, 
     main = "Número de pasajeros aéreos por mes (1949-1960)", 
     xlab = "Año", 
     ylab = "Número de pasajeros", 
     col = "blue", 
     lwd = 2)

# Añadir una línea de tendencia suavizada (opcional, mejora la visualización)
lines(lowess(time(AirPassengers), AirPassengers),col="red")

# Calcular estadísticas descriptivas básicas
mean_passengers <- mean(AirPassengers)  # Media
sd_passengers <- sd(AirPassengers)      # Desviación estándar

# Mostrar los resultados
print(paste("Media de pasajeros:", round(mean_passengers, 2)))
print(paste("Desviación estándar de pasajeros:", round(sd_passengers,2)))

# Descomponer la serie temporal
descompuesta <- decompose(AirPassengers)

# Visualizar la descomposición
plot(descompuesta)

# Opcionalmente, puedes graficar cada componente por separado si quieres más control:
# Tendencia
plot(descompuesta$trend, 
     main = "Componente de Tendencia", 
     xlab = "Año", 
     ylab = "Tendencia", 
     col = "blue", 
     lwd = 2)

# Estacionalidad
plot(descompuesta$seasonal, 
     main = "Componente Estacional", 
     xlab = "Año", 
     ylab = "Estacionalidad", 
     col = "green", 
     lwd = 2)

# Aleatorio (ruido)
plot(descompuesta$random, 
     main = "Componente Aleatorio (Ruido)", 
     xlab = "Año", 
     ylab = "Aleatoriedad", 
     col = "red",
     lwd = 2)

# Para la primera parte,verificamos la estructura del dataset y su clase (class(), summary()). 
# Cargar el dataset
data("AirPassengers")

# Inspeccionar la estructura del dataset
print(class(AirPassengers))   # Verifica que es una serie temporal (ts)
print(summary(AirPassengers)) # Resumen estadístico
print(start(AirPassengers))   # Inicio de la serie
print(end(AirPassengers))     # Fin de la serie
print(frequency(AirPassengers)) # Frecuencia: 12 (mensual)

# 1. Visualizar valores atípicos con boxplot
boxplot(AirPassengers, 
        main = "Boxplot de AirPassengers", 
        ylab = "Número de pasajeros", 
        col = "lightblue", 
        horizontal = TRUE)

# 2. Resaltar valores atípicos sobre la serie temporal
plot(AirPassengers, 
     main = "Serie Temporal con Valores Atípicos", 
     xlab = "Año", 
     ylab = "Número de pasajeros", 
     col = "blue", 
     lwd = 2)

# Identificar valores considerados atípicos
outlier_thresholds <- boxplot.stats(AirPassengers)$out

# Marcar los valores atípicos en rojo en el gráfico
points(time(AirPassengers)[AirPassengers %in% outlier_thresholds], 
       AirPassengers[AirPassengers %in% outlier_thresholds], 
       col = "red", 
       pch = 19)

# Interpretación de los resultados

# 1. Tendencias:
# - Observamos una tendencia creciente a lo largo de los años en el número de pasajeros aéreos.
# - La línea de tendencia suavizada y la componente de tendencia de la descomposición muestran 
#   claramente un aumento continuo, indicando un crecimiento sostenido de la demanda de vuelos 
#   desde 1949 hasta 1960.

# 2. Estacionalidad:
# - Existe una fuerte estacionalidad anual: cada año se repiten picos de mayor tráfico, 
#   especialmente durante los meses de verano (julio y agosto), coincidiendo con las vacaciones.
# - Esta estacionalidad es regular y consistente, como reflejan los gráficos de autocorrelación (ACF) 
#   y la componente estacional de la descomposición.

# 3. Ciclos y valores atípicos:
# - Aunque la serie muestra un patrón estacional claro, algunos valores atípicos aparecen en momentos 
#   donde los picos son excepcionalmente más altos que lo esperado para ese mes.
# - Estos picos irregulares pueden deberse a fenómenos extraordinarios como eventos especiales, 
#   cambios económicos o cambios en la industria aérea.

