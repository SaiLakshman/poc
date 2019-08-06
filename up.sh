#creation of channel poccommon
docker exec cli.org1 bash -c 'peer channel create -c poccommon -f ./channels/poccommon.tx -o orderer.poc:7050 -t 60s'
#joining the peers to that channel
docker exec cli.org1 bash -c 'peer channel join -o orderer.poc:7050 -b poccommon.block'
docker exec cli.org2 bash -c 'peer channel join -o orderer.poc:7050 -b poccommon.block'
docker exec cli.org3 bash -c 'peer channel join -o orderer.poc:7050 -b poccommon.block'
#updating the anchor.tx file for each of the organizations
docker exec cli.org1 bash -c 'peer channel update -o orderer.poc:7050 -c poccommon -f ./channels/org1-poccommon-anchor.tx'
docker exec cli.org2 bash -c 'peer channel update -o orderer.poc:7050 -c poccommon -f ./channels/org2-poccommon-anchor.tx'
docker exec cli.org3 bash -c 'peer channel update -o orderer.poc:7050 -c poccommon -f ./channels/org3-poccommon-anchor.tx'
#installing the chaincode on all the orgs
docker exec cli.org1 bash -c 'peer chaincode install -o orderer.poc:7050 -p simplyfi/simplyfi/training -n training -v 1.0'
docker exec cli.org2 bash -c 'peer chaincode install -o orderer.poc:7050 -p simplyfi/simplyfi/training -n training -v 1.0'
docker exec cli.org3 bash -c 'peer chaincode install -o orderer.poc:7050 -p simplyfi/simplyfi/training -n training -v 1.0'
#instantiating the chaincode on org1
docker exec cli.org1 bash -c "peer chaincode instantiate -o orderer.poc:7050 -C poccommon -n training -v 1.0 -c '{\"Args\":[]}'"
#upgrading the chaincode
#docker exec cli.org1 bash -c "peer chaincode upgrade -o orderer.telco.com:7050 -C poccommon -n training -v 1.1 -c '{\"Args\":[]}'"
