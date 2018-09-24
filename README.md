## LND Docker Images

See [comodal/lnd-docker](https://hub.docker.com/r/comodal/lnd-docker/) on Docker Hub for images.

### Example Bitcoin Testnet Neutrino LND

```sh
> docker run -d\
 --name lnd-bitcoin-testnet\
 -v lnd-bitcoin-testnet-data:/home/lnd/.lnd/data/\
 -v lnd-bitcoin-testnet-logs:/home/lnd/.lnd/logs/\
 comodal/lnd-docker:stretch-latest\
  --bitcoin.active\
  --bitcoin.testnet\
  --bitcoin.node=neutrino\
  --neutrino.connect=faucet.lightning.community\
  --lnddir=/home/lnd/.lnd\
  --datadir=/home/lnd/.lnd/data\
  --tlscertpath=/home/lnd/.lnd/data/tls.cert\
  --tlskeypath=/home/lnd/.lnd/data/tls.key\
  --logdir=/home/lnd/.lnd/logs
```

### Example CLI Usage

```sh
> docker exec -it lnd-bitcoin-testnet bash -l
>
> lncli\
 --macaroonpath=/home/lnd/.lnd/data/chain/bitcoin/testnet/admin.macaroon\
 --lnddir=/home/lnd/.lnd\
 --tlscertpath=/home/lnd/.lnd/data/tls.cert\
 --chain=bitcoin\
 --network=testnet\
 --help
```
