# Contenedor Docker con NASM + GCC para Orga2

## Intro
En este repo van a encontrar herramientas para poder correr programas implementados en NASM

## Requerimientos
- [Instalar Docker](https://docs.docker.com/engine/install/)
- [Instalar Docker Compose](https://docs.docker.com/compose/install/)

## Cómo usarlo
La idea es que todo el código que implementen para la materia lo hagan dentro del directorio de este repositorio.

Construir la imagen
```shell
docker-compose build orga2
```

Levantar una instancia del contenedor y correr `bash`
```shell
docker-compose run orga2 bash
```
