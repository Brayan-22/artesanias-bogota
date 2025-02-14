FROM amazoncorretto:17-alpine AS runtime

WORKDIR /app

# Crear usuario no root para nginx
RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

# Copiar archivos y establecer permisos
COPY target/*.jar ./app.jar
# Establece los permisos correctos
RUN chown -R nonroot:nonroot /app && \
    chmod -R 755 /app

# Cambiar a usuario no root
USER nonroot

CMD ["java", "-jar", "app.jar"]