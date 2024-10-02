#!/bin/bash

# Répertoire où se trouvent les images
INPUT_DIR="."  # Remplacer par le chemin du répertoire d'images si nécessaire

# Pour chaque fichier PNG dans le répertoire
for file in "$INPUT_DIR"/*.png; do
  # Récupère le nom de fichier sans l'extension
  filename="${file%.png}"

  echo "Traitement de l'image : $file"

  # Générer la version mobile (300px)
  magick convert "$file" -resize 300 -quality 85 "$filename-mobile.png"  # Version mobile en PNG
  magick convert "$file" -resize 300 -quality 85 "$filename-mobile.webp"  # Version mobile en WebP

  # Générer la version tablette (768px)
  magick convert "$file" -resize 768 -quality 85 "$filename-tablet.png"  # Version tablette en PNG
  magick convert "$file" -resize 768 -quality 85 "$filename-tablet.webp"  # Version tablette en WebP

  # Générer la version ordinateur (1200px)
  magick convert "$file" -resize 1200 -quality 85 "$filename-desktop.png"  # Version ordinateur en PNG
  magick convert "$file" -resize 1200 -quality 85 "$filename-desktop.webp"  # Version ordinateur en WebP

  echo "6 versions de l'image générées pour $file (mobile, tablette, ordinateur en PNG et WebP)"
done

echo "Optimisation terminée."
