#!/bin/bash

# Chemin du répertoire contenant les fichiers .png
DIRECTORY="src/content/wallpapers"

# Vérification de l'existence du répertoire
if [ ! -d "$DIRECTORY" ]; then
    echo "Erreur : le répertoire $DIRECTORY n'existe pas."
    exit 1
fi

# Parcourir chaque fichier .png dans le répertoire
for png_file in "$DIRECTORY"/*.png; do
    # Vérification si le fichier .png existe réellement (au cas où il n'y a pas de fichiers .png)
    if [ ! -f "$png_file" ]; then
        continue
    fi

    # Récupération du nom de base du fichier sans extension
    base_name=$(basename "$png_file" .png)

    # Chemin du fichier .md correspondant
    md_file="$DIRECTORY/$base_name.md"

    # Vérification si le fichier .md n'existe pas déjà
    if [ ! -f "$md_file" ]; then
        # Écriture du contenu dans le fichier .md
        echo "---" > "$md_file"
        echo "image: ./$base_name.png" >> "$md_file"
        echo "---" >> "$md_file"
        echo "Fichier $md_file créé avec succès."
    else
        echo "Le fichier $md_file existe déjà. Il n'a pas été modifié."
    fi
done

echo "Opération terminée."
