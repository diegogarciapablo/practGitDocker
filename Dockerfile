# Imagen base liviana con el servidor web nginx ya instalado
FROM nginx:alpine

# Reemplazamos la página por defecto de nginx con la nuestra
COPY index.html /usr/share/nginx/html/index.html
COPY style.css  /usr/share/nginx/html/style.css

# nginx escucha en el puerto 80 dentro del contenedor
EXPOSE 80
