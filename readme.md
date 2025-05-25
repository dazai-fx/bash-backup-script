# Backup automático de archivos o directorios

Script en Bash que realiza copias de seguridad de carpetas específicas (por ejemplo, `~/Documentos`), guardando las copias con fecha y hora para evitar sobrescribir backups anteriores.
.

# Instrucciones de uso

## 1 Dale permisos de ejecución

chmod +x backup_menu.sh

## ejecuta el script

./backup_menu.sh

## Usa el menú interactivo

Desde el menú podrás:

- Cambiar el directorio de origen (la carpeta que quieres respaldar).

- Cambiar el directorio de destino (donde se guardarán los backups).

- Cambiar el nombre base del archivo de backup.

- Ejecutar el backup con la configuración seleccionada.

- Salir del programa.

## Requisitos

- Bash (disponible en la mayoría de sistemas Unix/Linux y macOS).

- Permisos para leer la carpeta origen y escribir en la carpeta destino.
