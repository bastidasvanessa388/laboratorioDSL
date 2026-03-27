#!/bin/bash
NODO="nodo3"
FECHA=$(date '+%Y-%m-%d_%H-%M-%S')
DESTINO="/tmp/backup_${NODO}_${FECHA}"

echo "============================================"
echo "  BACKUP INICIADO"
echo "  Nodo   : $NODO"
echo "  Fecha  : $FECHA"
echo "============================================"

echo "[1/3] Identificando archivos críticos..."
ARCHIVOS=("database.sql" "config.yml" "app.log" "users.csv")
for f in "${ARCHIVOS[@]}"; do
    echo "  → Encontrado: $f ($(( RANDOM % 500 + 100 ))KB)"
    sleep 0.3
done

echo "[2/3] Comprimiendo y guardando en $DESTINO..."
sleep 1
mkdir -p "$DESTINO"
for f in "${ARCHIVOS[@]}"; do
    echo "  ✔ Respaldado: $f"
    sleep 0.2
done

echo "[3/3] Verificando integridad del backup..."
sleep 0.5
TOTAL=${#ARCHIVOS[@]}
echo "  ✔ $TOTAL archivos respaldados correctamente"

echo "============================================"
echo "  BACKUP COMPLETADO EN $NODO"
echo "============================================"
