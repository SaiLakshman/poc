docker exec cli.org1 bash -c "peer chaincode invoke -C poccommon -n training -c '{\"Args\":[\"create\",\"I0036\",\"Sai Lakshman\", \"Innovation Engineer\", \"9948035024\", \"Playing VolleyBall\"]}'"
sleep 3
docker exec cli.org1 bash -c "peer chaincode invoke -C poccommon -n training -c '{\"Args\":[\"retrieve\",\"I0036\"]}'"
sleep 3
docker exec cli.org1 bash -c "peer chaincode invoke -C poccommon -n training -c '{\"Args\":[\"update\",\"I0036\",\"Playing Cricket\"]}'"
sleep 3
docker exec cli.org1 bash -c "peer chaincode invoke -C poccommon -n training -c '{\"Args\":[\"queryByName\",\"Sai Lakshman\"]}'"
sleep 3
docker exec cli.org1 bash -c "peer chaincode invoke -C poccommon -n training -c '{\"Args\":[\"history\",\"I0036\"]}'"
