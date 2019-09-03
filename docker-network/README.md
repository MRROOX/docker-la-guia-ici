# DOCKER NETWORKS

### Comandos Basicos
#### Ver comando Basicos :D
```
docker network
```
#### Ver comando Avanzados :D
```
docker network <comando_basico> --help
```
#### Crear una network personalizada.
```
docker network create <nombre_de_red>
```

#### Inspeccionar un Netwokr

```
docker network inspect <nombre_de_red>
```
#### Listar las Netwokr

```
docker network ls
```
# Ejemplo Basico.

```
docker network create test-network
```
# Ejemplo Avanzado.

```
docker network create -d bridge --subnet 172.124.10.0/24 --gateway 172.124.10.1 test-network-avanzada
```
# Agregar un Contenedor a una Network distinta.

## En la creacion del contenedor especificando la Network.

```
docker run --network test-network-avanzada -d --name test123 -ti centos
```
```
docker inspect test123
```
## En la creacion del contenedor.
```
docker create network red_uno
```
```
docker run -d --network red_uno nginx
```
#### Nota: Los valores con los que se crea la red son gestionados por docker.

# Conectar contenedores en un Misma Red.

## Ejemplo
#### contenedor 1
```
docker run -d --network test-network-avanzada --name cont1 -ti centos
```

### contenedor 2
```
docker run -d --network test-network-avanzada --name cont2 -ti centos
```

### Prando la red.
```
docker inspect cont1
```

```
docker exec cont1 bash -c "ping <ip_cont2>"
```
```
docker exec cont2 bash -c "ping <ip_cont1>"
```

## Ver contenedores por su nombre.

```
docker exec cont2 bash -c "ping <nombre_cont1>"
```
```
docker exec cont1 bash -c "ping <nombre_cont2>"
```

### Contra ejemplo

```
docker run -d --network net_test cont3 -ti centos
```
```
docker exec cont1 bash -c "ping <nombre_cont3>"
```
## Contectar un Contenedor a una red Existente.

```
docker network connect test-network-avanzada cont3
```
## Desontectar un Contenedor a una red Existente.

```
docker network disconnect test-network-avanzada cont3
```