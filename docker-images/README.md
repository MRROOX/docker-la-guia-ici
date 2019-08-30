# DOCKER IMAGES.

# Comando Basicos



# Imagenes Oficiales y Contenedores

Estas imágenes de docker son desarrolladas por las empresas oficiales, y se encuentra toda la configuracion para poder trabajar con ellas. Estas imagens se almacenan en Docker HUB (https://hub.docker.com/).

#### Ejemplo MONGO DB

Buscar docker mongo

En nuestra terminal del servidor :

```
docker pull mongo

```

Por defecto se descarga una versión de imagen con el `tag: latest` 

#### Manejo de tags:
Un tag es la versión de la imagen oficial de docker, pueden existir diferentes versiones.

Para descargar una imagen con un versión específica escribimos lo siguiente en nuestro servidor:

```
docker pull mongo:3.6.5-jessie

```

El `tag` es  `3.6.5-jessie`

Ahora para revisar las imágenes de mongo que tenemos en nuestro sistema:

```
docker images | grep mongo

```
#### Eliminar Imagenes 

```
docker images 

```

```
docker rmi <nombre_imagen>

```
#### Ejemplo SONARQUBE


Se descarga una imagen de sonarqube
```
docker pull sonarqube
```
Para ejecutar un contenedor con la imagen de `sonarqube`
```
docker run -d --name sonarqube -p 9000:9000 sonarqube
```
```
docker run -d --name sonarqube_dos -p 9002:9000 sonarqube
```


`-d` (Detached) especifica que el contenedor se inicia separado de la terminal

`--name` define el nombre que queramos para el contenedor

`-p` define los puertos < `host` > : < `contendor` >

```
docker run -d --name <nombre_contendor> -p <puerto_HOST>:<puerto_CONTENEDOR> <imagen:tag>
```
## NOTA: LOS CAMBIOS REALIZADOS EN EL CONTENDOR SOLO PERSISTEN EN TIEMPO DE EJECUCIÓN. 

# (Dockerfile) Creacion de Imagenes y Contenedores.

## Creacion de nuestro primer Dockerfile

```
cd docker-images

nano Dockerfile
```
Escribimos nuestro Dockerfile

```
FROM centos
RUN yum install httpd -y
```
### Esto nos descargar una imagen con centos `(lastest)` y nos instala apache (httpd).
Una vez guardado los cambios del archivo Dockerfile procedemos a construir la imagen.
```
docker build --tag <nombre_de_imagen>:<tag> .
```
```
docker build -t <nombre_de_imagen>:<tag> .
```
```
docker build --tag apache-centos .
```
Nota: al ejecutar este comando por defecto creará la imagen con el `tag:lastet` también el “punto” del final del comando es muy importante.

También la podemos crear la imagen con una versión especifica.
```
docker build --tag apache-centos:primera .
```
### Para ejecutar nuestra imagen apache-centos utilizamos el comando:

```
docker run -d --name apache apache-centos
```

#####  IMPORTANTE: Al ejecutar este comando, el contenedor se ejecutara y se destruirá de inmediato, esto quiere decir que no se mantendrá en ejecución. Esto ocurre porque el CMD que ejecuta es el por defectos de  Centos, entonces dentro del Dockerfile necesitamos especificar el CMD para que se ejecute el servicio de Apache en foreground o en segundo plano.

#### Para solucionar esto debemos agregar los comando de `CMD`  en el Dockerfile, y volver a construir la imagen.
```
nano Dockerfile
```
```
FROM centos

RUN yum install httpd -y

CMD apachectl -DFOREGROUND
```
Y para construir la Imagen nuevamente debemos ejecutar el comando:
```
docker build --tag apache-centos:apache-cmd .
```
 Ahora para volver a ejecutar la imagen personalizada utilizamos el comando con la nueva imagen.
```
docker run -d --name apache apache-centos:apache-cmd
```

#### IMPORTANTE: Ahora el contenedor se encuentra ejecutando de forma correcta. PERO NO PODEMOS ACCEDER

Agregando Puerto a Nuestro Contendor.
Para agregar un puerto a nuestro contenedor debemos utilizar el siguiente comando:

```
docker run -d --name <nombre_contenedor> -p <puerto_Host>:<puerto_Contenedor> <imagen_contenedor>
```
```
docker run -d --name apache -p 80:80 apache-centos:apache-cmd
```

Revisar: http://localhost:80

# Dockerfile a_fondo
#### trabajando en el directorio `a_fondo`
```
cd a_fondo
```

El archivo Dockerfile puede tener cualquier nombre, pero por convencion se utiliza `nombre.Dockerfile` en este caso `guia_ici.Dockerfile`

Ahora debemos construir nuestra imagen de nuevo para que se apliquen los cambios.
```
docker build --tag apache . -f guia_ici.Dockerfile
```

```
docker build --tag <nombre_tag> . -f <nombre.Dockerfile>
```

Para ejecutar la imagen

```
docker run -d -p 80:80 apache
```




