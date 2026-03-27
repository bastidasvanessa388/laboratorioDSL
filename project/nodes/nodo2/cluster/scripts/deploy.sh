#!/bin/bash
NODO="nodo2"
APP=${1:-"app-default"}

echo "============================================"
echo "  DEPLOY INICIADO"
echo "  Nodo   : $NODO"
echo "  App    : $APP"
echo "  Hora   : $(date '+%H:%M:%S')"
echo "============================================"

echo "[1/4] Verificando dependencias..."
sleep 1
echo "  ✔ Dependencias OK"

echo "[2/4] Descargando archivos de $APP..."
sleep 1
for i in config.yml app.jar database.sql; do
    echo "  → Copiando $i"
    sleep 0.3
done
echo "  ✔ Archivos copiados"

echo "[3/4] Reiniciando servicios..."
sleep 1
echo "  ✔ Servicio web reiniciado"
echo "  ✔ Servicio db reiniciado"

echo "[4/4] Verificando estado..."
sleep 0.5
echo "  ✔ App corriendo en puerto 8080"

echo "============================================"
echo "  DEPLOY COMPLETADO EN $NODO"
echo "============================================"
