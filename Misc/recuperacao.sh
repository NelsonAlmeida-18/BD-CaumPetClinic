

echo  "Seja bem vindo ao sistema de recuperação de dados da CaumPetClinic"
read -p "Qual o diretório dos backups: " dirName

ls -tp $1 | grep -v /$ | head -1 > fileName

