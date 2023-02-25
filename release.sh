#docker rmi -f $(docker images -q '626404419872.dkr.ecr.eu-central-1.amazonaws.com/marketplace-integrator/orders-service' | uniq) || echo 'empty'
echo "arguments 1 is : $1"
echo "argument 2 is : $2"
rm pipeline_ukol.jar
./gradlew clean build
mv ./build/libs/pipeline_ukol.jar ./
./gradlew docker -Pargs="$1,$2"
./gradlew tasks
./gradlew dockerTagDockerHub -Pargs="$1,$2"
#docker login
./gradlew dockerPushDockerHub -Pargs="$1,$2"
#./gradlew dockerRun
