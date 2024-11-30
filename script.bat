echo "Criando as Imagens........"

docker build -t rrodney/projeto-backend:1.0 backend/.
docker build -t rrodney/projeto-database:1.0 database/.

echo "Realizando Push das Imagens........"

docker push rrodney/projeto-backend:1.0
docker push rrodney/projeto-database:1.0

echo "Criando servicos no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments...."
kubectl apply -f ./deployments.yml
