#!/bin/bash

# Répertoire où se trouvent les images
INPUT_DIR="."  # Remplacer par le chemin du répertoire d'images si nécessaire

# Pour chaque fichier JPG dans le répertoire
for file in "$INPUT_DIR"/*.jpg; do
  # Récupère le nom de fichier sans l'extension
  filename="${file%.jpg}"

  echo "Traitement de l'image : $file"

  # Générer la version mobile (300px)
  magick "$file" -resize 300 -quality 85 "$filename-mobile.jpg"  # Version mobile en JPG
  magick "$file" -resize 300 -quality 85 "$filename-mobile.webp"  # Version mobile en WebP

  # Générer la version tablette (768px)
  magick "$file" -resize 768 -quality 85 "$filename-tablet.jpg"  # Version tablette en JPG
  magick "$file" -resize 768 -quality 85 "$filename-tablet.webp"  # Version tablette en WebP

  # Générer la version ordinateur (1200px)
  magick "$file" -resize 1200 -quality 85 "$filename-desktop.jpg"  # Version ordinateur en JPG
  magick "$file" -resize 1200 -quality 85 "$filename-desktop.webp"  # Version ordinateur en WebP

  echo "6 versions de l'image générées pour $file (mobile, tablette, ordinateur en JPG et WebP)"
done

echo "Optimisation terminée."
