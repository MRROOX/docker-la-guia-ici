# DOCKER la Guia ICI

# Comando Basicos

#### Podemos ver todos las directivas utilizadas por docker.
```
docker
```
#### Docker Version
```
docker -v
```
#### Lista los Contenedores en ejecucion
```
docker ps
```
#### Lista las imagenes disponibles en el HOST
```
docker images
```
#### Lista los Volumenes en el HOST
```
docker volume ls
```
#### Lista las redes en el HOST
```
docker network ls
```
#### Descargamos una imagen oficial disponible en DOCKER HUB.
```
docker pull <image_oficial:tag>
```
#### Ver toda la informacion de un Contenedor
```
docker inspect <nombre o id del contenedor>
```
#### Ver logs del Contendor

```
docker logs -f mi_mysql
```

# Instalar Docker
```
Config file /lib/systemd/system/docker.service
```
# CentOS
---------

## Utilidades
```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```
## Agregar el repo de docker
```
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
## Instalar docker
```
sudo yum install docker-ce -y
```
## Iniciar el servicio
```
sudo systemctl start docker
```
## Iniciarlo con el sistema
```
sudo systemctl enable docker
```
## Agregar usuario al grupo docker 

whoami # Saber el nombre de tu usuario
```
sudo usermod -aG docker nombre_de_salida_en_whoami
```
## Salir de la sesión
```
exit
```
## Iniciar de nuevo con el usuario y probar 
```
docker run hello-world
```
# Fedora 
---------

## La instalación es igual que en CentOS, solo deben modificar la url del repo, porque los pasos son idénticos

## Utilidades
```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```
## Agregar el repo de docker
```
sudo yum-config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
```
## Instalar docker
```
sudo yum install docker-ce -y
```
## Iniciarlo con el sistema
```
sudo systemctl enable docker
```
## Agregar usuario al grupo docker 

whoami # Saber el nombre de tu usuario
```
sudo usermod -aG docker nombre_de_salida_en_whoami
```
## Salir de la sesión
```
exit
```
## Iniciar de nuevo con el usuario y probar 
```
docker run hello-world
```
# Ubuntu
---------

## Actualiza los repos
```
sudo apt-get update
```
## Instala utilidades
```
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
```
## Agregar el gpg 
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
## Agregar el repo
```
 sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 ```

## Actualizar de nuevo
```
 sudo apt-get update
```
## Instalar docker
```
 sudo apt-get install docker-ce
```
## Iniciarlo con el sistema

```
sudo systemctl enable docker
```
## Agregar usuario al grupo docker 

whoami # Saber el nombre de tu usuario
```
sudo usermod -aG docker nombre_de_salida_en_whoami
```
## Salir de la sesión
```
exit
```
## Iniciar de nuevo con el usuario y probar 
```
docker run hello-world
```


# Debian
---------

## Actualiza los repos
```
sudo apt-get update
```

## Instala utilidades
```
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
```

## Agregar el gpg 

```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

```
## Agregar el repo

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
```

## Actualizar de nuevo

```
sudo apt-get update
```

## Instalar docker

```
sudo apt-get install docker-ce
```

## Iniciarlo con el sistema

```
sudo systemctl enable docker
```

## Agregar usuario al grupo docker 

whoami # Saber el nombre de tu usuario
```
sudo usermod -aG docker nombre_de_salida_en_whoami
```

## Salir de la sesión
exit

## Iniciar de nuevo con el usuario y probar 

``` 
docker run hello-world 
```


# Instalar Docker-Compose
https://docs.docker.com/compose/install/


```
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

```
sudo chmod +x /usr/local/bin/docker-compose
```
```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

```
# Windows

https://docs.docker.com/docker-for-windows/install/


# MAC

https://docs.docker.com/docker-for-mac/install/


# Flujo de la Guia ICI

## 1) DOCKER IMAGES

## 2) DOCKER CONTAINERS

## 3) DOCKER VOLUMES

## 4) DOCKER NETWORK

## 5) DOCKER-COMPOSE
