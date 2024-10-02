#!/bin/bash

# Répertoire où se trouvent les images
INPUT_DIR="."  # Remplacer par le chemin du répertoire d'images si nécessaire

# Pour chaque fichier JPG dans le répertoire
for file in "$INPUT_DIR"/*.jpg; do
  # Récupère le nom de fichier sans l'extension
  filename="${file%.jpg}"

  echo "Traitement de l'image : $file"

  # Placeholder petit (320px)
  magick "$file" -resize 320 -quality 100 "$filename-placeholder-small.jpg"  # Petit en JPG

  # Placeholder moyen (640px)
  magick "$file" -resize 640 -quality 100 "$filename-placeholder-medium.jpg"  # Moyen en JPG

  # Placeholder large (1024px)
  magick "$file" -resize 1024 -quality 100 "$filename-placeholder-large.jpg"  # Large en JPG

  # Placeholder très grand (1920px)
  magick "$file" -resize 1920 -quality 100 "$filename-placeholder-xlarge.jpg"  # Très grand en JPG

  echo "4 versions de l'image générées pour $file (4 tailles en JPG)"
done

echo "Optimisation terminée."
