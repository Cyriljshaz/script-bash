#!/bin/bash

# Répertoire où se trouvent les images
INPUT_DIR="."  # Remplacer par le chemin du répertoire d'images si nécessaire

# Pour chaque fichier JPG dans le répertoire
for file in "$INPUT_DIR"/*.png; do
  # Récupère le nom de fichier sans l'extension
  filename="${file%.jpg}"

  echo "Traitement de l'image : $file"

  # Placeholder petit (320px)
  magick "$file" -resize 320 -quality 100 "$filename-320.png"  # Petit en PNG

  # Placeholder moyen (640px)
  magick "$file" -resize 640 -quality 100 "$filename-640.png"  # Moyen en PNG

  # Placeholder large (1024px)
  magick "$file" -resize 1024 -quality 100 "$filename-1024.png"  # Large en PNG

  # Placeholder très grand (1920px)
  magick "$file" -resize 1920 -quality 100 "$filename-1920.png"  # Très grand en PNG

  echo "4 versions de l'image générées pour $file (4 tailles en PNG)"
done

echo "Optimisation terminée."
