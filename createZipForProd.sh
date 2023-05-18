#!/bin/sh

# Manuel
### ./createZipForProd.sh numeroVersion de la livraison
### Exemple :
### ./createZipForProd.sh 0.0.2

# On recupère l'archive depuis jenkins
chmod u+x ../Jenkins/jenkins_home/workspace/BeezyStart_Up_branchForDelete/VersionsArchives/beezy_start_up_$1.zip        
cp ../Jenkins/jenkins_home/workspace/BeezyStart_Up_branchForDelete/VersionsArchives/beezy_start_up_$1.zip tmpForProd
# On effectue les actions depuis un dossier temporaire
cd tmpForProd
# Dezippe l'archive et supprime les fichiers non necessaire
unzip -o beezy_start_up_$1.zip
rm -rf vendor
rm -rf VersionsArchives
rm -rf composer.json
rm -rf composer.lock
rm -rf Dockerfile
rm -rf ftp.sh
rm -rf Jenkinsfile
rm -rf README.md
rm -rf beezy_start_up_$1.zip
# Prépare le dossier de Pro
mkdir ../Beezy_Start_Up
mv * ../Beezy_Start_Up

mv Beezy_Start_Up.zip ~/Bureau


# 1 - Supprimer le dossier de production à la main
# 2 - zip -r Beezy_Start_Up.zip ../Beezy_Start_Up -> copier l archive sur le bureau
# 3 - Télécharger l 'archive depuis l IHM
# 4 - Nettoyage -> Supprimer l'archive sur le Bureau, supprimer le dossier Beezy_Start_Up dans le projet local


