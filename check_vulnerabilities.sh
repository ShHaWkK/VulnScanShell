#!/bin/bash

# Chemin vers le répertoire Lynis cloné
LYNIS_DIR="./lynis"

# Vérifier si l'utilisateur est root (commenté pour Git Bash sur Windows)
#if [ "$EUID" -ne 0 ]; then
#  echo "Veuillez exécuter ce script en tant que root."
#  exit 1
#fi

# Vérifier si lynis est disponible dans le répertoire cloné
if [ ! -f "$LYNIS_DIR/lynis" ]; then
  echo "Lynis n'est pas disponible. Assurez-vous d'avoir cloné le dépôt correctement."
  exit 1
fi

# Créer un répertoire pour les logs de lynis
LOG_DIR="./logs"
mkdir -p $LOG_DIR

# Exécuter lynis et sauvegarder les résultats dans un fichier log
LOG_FILE="$LOG_DIR/lynis_$(date +%Y%m%d_%H%M%S).log"
echo "Exécution de lynis... Les résultats seront enregistrés dans $LOG_FILE."
$LYNIS_DIR/lynis audit system > $LOG_FILE

echo "Analyse terminée. Consultez le fichier de log pour les résultats détaillés."
