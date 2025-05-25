#!/bin/bash

# Variables por defecto
ORIGEN="$HOME/Documentos"
DESTINO="$HOME/Backups"
NOMBRE_BASE="backup"

while true; do
    clear
    echo "==== MENU DE BACKUP AUTOMÁTICO ===="
    echo "1) Cambiar directorio de ORIGEN (actual: $ORIGEN)"
    echo "2) Cambiar directorio de DESTINO (actual: $DESTINO)"
    echo "3) Cambiar nombre base del archivo (actual: $NOMBRE_BASE)"
    echo "4) Ejecutar backup"
    echo "5) Salir"
    echo "==================================="
    read -p "Selecciona una opción [1-5]: " opcion

    case $opcion in
        1)
            read -p "Escribe el nuevo directorio de ORIGEN: " nuevo_origen
            if [ -d "$nuevo_origen" ]; then
                ORIGEN="$nuevo_origen"
                echo "Directorio de ORIGEN actualizado."
            else
                echo "Error: el directorio no existe."
            fi
            read -p "Presiona Enter para continuar..."
            ;;
        2)
            read -p "Escribe el nuevo directorio de DESTINO: " nuevo_destino
            # Creamos la carpeta destino si no existe
            mkdir -p "$nuevo_destino" 2>/dev/null
            if [ $? -eq 0 ]; then
                DESTINO="$nuevo_destino"
                echo "Directorio de DESTINO actualizado."
            else
                echo "Error: no se pudo crear el directorio."
            fi
            read -p "Presiona Enter para continuar..."
            ;;
        3)
            read -p "Escribe el nuevo nombre base para el archivo de backup: " nuevo_nombre
            if [ -n "$nuevo_nombre" ]; then
                NOMBRE_BASE="$nuevo_nombre"
                echo "Nombre base actualizado."
            else
                echo "Error: el nombre no puede estar vacío."
            fi
            read -p "Presiona Enter para continuar..."
            ;;
        4)
            FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
            NOMBRE_BACKUP="${NOMBRE_BASE}_$FECHA.tar.gz"
            tar -czf "$DESTINO/$NOMBRE_BACKUP" -C "$ORIGEN" .
            if [ $? -eq 0 ]; then
                echo "Backup creado correctamente en: $DESTINO/$NOMBRE_BACKUP"
            else
                echo "Error: no se pudo crear el backup."
            fi
            read -p "Presiona Enter para continuar..."
            ;;
        5)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción inválida. Intenta de nuevo."
            read -p "Presiona Enter para continuar..."
            ;;
    esac
done