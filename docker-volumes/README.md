# Volumes en Docker

### Comandos Basicos
#### Ver Volumes

```
docker volume ls
```
#### Detener Contenedor
```
docker stop <nombre_container>
```
#### Iniciar Contenedor
```
docker start <nombre_container>
```
#### Eliminar Contenedor y Volumen Anonymous
```
docker rm -fv <nombre_contenedor>
```

## Tipo de Volumes de `Host`

#### Comando:

```
docker run --name <nombre_contenedor> -v <sistemas_archivo_HOST>:<sistema_archivo_CONTENEDOR> -p <puerto_HOST>:<puerto_Contenedor> -e "MYSQL_ROOT_PASSWORD=1234" <nombre_imagen:tag> 
```
Con el parametro `-v` se define el volumen de tipo Host `-v <sistemas_archivo_HOST>`:`<sistema_archivo_CONTENEDOR>` en el sistema de archivos del host se debe especificar la ruta absoluta.


## Ejemplo MySql

```
docker run --name mi_mysql -v /home/$USER/DOCKER_LA_GUIA_ICI/mi_mysql_data:/var/lib/mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=1234" mysql:5.7.16 
```
## Ejemplo Jenkins 

#### Error -> `Can not write to /var/jenkins_home/copy_reference_file.log. Wrong volume permissions?`

#### Crear Carpeta 

```
sudo mkdir /opt/jenkins
```
```
sudo chown -R 1000:1000 /opt/jenkins
```
```
docker run --name mi_jenkins -v /opt/jenkins:/var/jenkins_home -p 8080:8080 jenkins/jenkins:lts
```
## Tipo de Volumes de `Anonymous`

#### Comando:

```
docker run --name <nombre_contenedor> -v <sistema_archivo_CONTENEDOR> -p <puerto_HOST>:<puerto_Contenedor> -e "MYSQL_ROOT_PASSWORD=1234" <nombre_imagen:tag> 
```
Con el parametro `-v` se define el volumen de tipo Host `-v` `<sistema_archivo_CONTENEDOR>` no se especifica un volumen, esto lo gestiona docker de forma "random".

#### Ver Volumes

```
docker volume ls
```
#### Detener Contenedor
```
docker stop mi_mysql
```
#### Iniciar Contenedor
```
docker start mi_mysql
```
#### Eliminar Contenedor y Volumen Anonymous
```
docker rm -fv mi_mysql
```
## Ejemplo MySql

```
docker run --name mi_mysql -v /var/lib/mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=1234" mysql:5.7.16 
```
## Ejemplo Jenkins 

```
docker run --name mi_jenkins -v /var/jenkins_home -p 8080:8080 jenkins/jenkins:lts
```

#### Ver Volumes

```
docker volume ls
```
#### Detener Contenedor
```
docker stop mi_jenkins
```
#### Iniciar Contenedor
```
docker start mi_jenkins
```
#### Eliminar Contenedor y Volumen Anonymous
```
docker rm -fv mi_jenkins
```

nota: el parametro `-fv` hace que el contendor y el volumen anonimo se elimine. Si solo usamos `-f` no se elimina el volumen.

# Tipo de Volumes `Named Volumes`

Creación del Volumen

```
docker volume create mi-volume
```
Asignar el volumen a un contendor.

```
docker run --name mi_jenkins -v mi-volume:/var/jenkins_home -p 8080:8080 jenkins/jenkins:lts
```

#### Eliminar Contenedor y Volumen Anonymous
```
docker rm -fv mi_jenkins
```

Nota: al aplicar este comando podemos ver que el volumen persiste.


# Dangling Volumes

Son Volumenes que no estan referenciados a ningun contendor.

#### Listar Dangling Volumes
```
docker volume ls -f dangling=true
```

#### Elimiar todos los Dagling Volumes

```
docker volume ls -f dangling=true -q | xargs docker volume rm
```

