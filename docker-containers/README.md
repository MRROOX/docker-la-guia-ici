# Contenedores Ejemplos.

# Instalación Contendor MySql.

```
docker run -d --name mi_mysql -e "MYSQL_ROOT_PASSWORD=1234" mysql:5.7.16
```
### Ver logs del Contendor

```
docker logs -f mi_mysql
```
### Ver toda la informacion sobre el contenedor

```
docker inspect mi_mysql
```

### Aceder a MYSQL dentro del Contenedor desde Nuestro Host.


```
mysql -u root -h 172.17.0.2 -p1234
```

## Instalacion .
