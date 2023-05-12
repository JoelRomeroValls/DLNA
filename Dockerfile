# Utiliza una imagen base con Ubuntu 22.04
FROM ubuntu:22.04

# Actualiza el sistema y instala las dependencias necesarias
RUN apt-get update && \
    apt-get install -y minidlna vlc

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo de configuración de DLNA al contenedor
COPY minidlna.conf /etc/minidlna.conf

# Establece los volúmenes para los archivos multimedia
VOLUME ["/media/Música"]
VOLUME ["/media/Vídeos"]
VOLUME ["/media/Imágenes"]
VOLUME ["/media/Descargas"]
VOLUME ["/stream"]

# Expone el puerto de DLNA
EXPOSE 8200/tcp
EXPOSE 1900/udp
# Inicia el servidor DLNA
CMD ["/usr/sbin/minidlnad", "-d" "-S"]

