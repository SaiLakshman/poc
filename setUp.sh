sudo rm -r orderer channels
mkdir orderer channels
#cryptogen generate --config crypto-config.yaml
export FABRIC_CFG_PATH=./ #path to the configtx.yaml

configtxgen -profile Genesis -outputBlock ./orderer/genesis.block

configtxgen -profile CommonChannel -outputCreateChannelTx ./channels/poccommon.tx -channelID poccommon
configtxgen -profile CommonChannel -outputAnchorPeersUpdate ./channels/org1-poccommon-anchor.tx -channelID poccommon -asOrg Org1MSP
configtxgen -profile CommonChannel -outputAnchorPeersUpdate ./channels/org2-poccommon-anchor.tx -channelID poccommon -asOrg Org2MSP
configtxgen -profile CommonChannel -outputAnchorPeersUpdate ./channels/org3-poccommon-anchor.tx -channelID poccommon -asOrg Org3MSP
