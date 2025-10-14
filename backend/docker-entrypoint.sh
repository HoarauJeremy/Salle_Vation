#!/usr/bin/env bash
set -euo pipefail

APP_DIR=${APP_DIR:-/app}

cd "$APP_DIR"

# 1) Si aucun composer.json => on génère un nouveau projet Symfony 6.4
if [ ! -f "composer.json" ]; then
  echo "Aucun projet détecté. Création d'un nouveau projet Symfony 6.4..."
  # Projet minimal; pour un site complet utilisez 'symfony/webapp'
  composer create-project symfony/skeleton:"^6.4" . --no-interaction
  # Optionnel : pack webapp si vous voulez Twig, Asset, etc.
  # composer require symfony/webapp-pack --no-interaction
fi

# 2) Installer les dépendances (utile au premier run ou après modifs)
echo "Installation des dépendances Composer..."
composer install --prefer-dist --no-interaction

# 3) Droits d'écriture sur var/ (cache & logs)
mkdir -p var
chmod -R 777 var || true

# 4) Exécuter la commande passée (par défaut le serveur PHP via CMD)
echo "Lancement : $*"
exec "$@"