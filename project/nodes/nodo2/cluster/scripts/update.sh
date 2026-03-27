#!/bin/bash
NODO="nodo2"

echo "============================================"
echo "  UPDATE INICIADO"
echo "  Nodo   : $NODO"
echo "  Hora   : $(date '+%H:%M:%S')"
echo "============================================"

echo "[1/4] Actualizando lista de paquetes..."
sleep 1
PAQUETES=("nginx" "python3" "git" "curl" "htop")
echo "  ✔ Lista actualizada: ${#PAQUETES[@]} paquetes disponibles"

echo "[2/4] Verificando paquetes desactualizados..."
sleep 0.5
for p in "${PAQUETES[@]}"; do
    VERSION_OLD="1.$(( RANDOM % 9 )).$(( RANDOM % 9 ))"
    VERSION_NEW="1.$(( RANDOM % 9 + 1 )).0"
    echo "  → $p: $VERSION_OLD → $VERSION_NEW"
    sleep 0.2
done

echo "[3/4] Instalando actualizaciones..."
sleep 1
for p in "${PAQUETES[@]}"; do
    echo "  ✔ $p actualizado"
    sleep 0.3
done

echo "[4/4] Limpiando paquetes temporales..."
sleep 0.5
echo "  ✔ Cache limpiada"
echo "  ✔ Sistema al día"

echo "============================================"
echo "  UPDATE COMPLETADO EN $NODO"
echo "============================================"
