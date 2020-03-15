## [LND](https://github.com/LightningNetwork/lnd) Docker Images

See [dmp1ce/lnd](https://hub.docker.com/r/dmp1ce/lnd/tags/) on Docker Hub for available images.

## Tags

- `0.9.2-beta`, `0.9-beta`, `latest` ([v0.9-beta/DebianDockerfile](https://github.com/dmp1ce/lnd-docker/blob/hub/v0.9-beta/DebianDockerfile))
- `0.9.2-beta-alpine`, `0.9-beta-alpine`, `alpine` ([v0.9-beta/AlpineDockerfile](https://github.com/dmp1ce/lnd-docker/blob/hub/v0.9-beta/AlpineDockerfile))
- `0.8.2-beta`, `0.8-beta` ([v0.8-beta/DebianDockerfile](https://github.com/dmp1ce/lnd-docker/blob/hub/v0.8-beta/DebianDockerfile))
- `0.8.2-beta-alpine`, `0.8-beta-alpine` ([v0.8-beta/AlpineDockerfile](https://github.com/dmp1ce/lnd-docker/blob/hub/v0.8-beta/AlpineDockerfile))
- `0.7.1-beta`, `0.7-beta`, `latest` ([v0.7-beta/DebianDockerfile](https://github.com/dmp1ce/lnd-docker/blob/hub/v0.7-beta/DebianDockerfile))
- `0.7.1-beta-alpine`, `0.7-beta-alpine`, `alpine` ([v0.7-beta/AlpineDockerfile](https://github.com/dmp1ce/lnd-docker/blob/hub/v0.7-beta/AlpineDockerfile))

**Picking the right tag**

- `dmp1ce/lnd:latest`: points to the latest stable release available of LND. Use this only if you know what you're doing as upgrading blindly is a risky procedure.
- `dmp1ce/lnd:<version>`: based on a slim Debian image, points to a specific version branch or release.
- `dmp1ce/lnd:<version>-alpine`: based on Alpine Linux, points to a specific version branch or release. Uses a simple, resource efficient Linux distribution with security in mind.

### Example Bitcoin Testnet Neutrino LND

```sh
> docker run -d\
 --name lnd-bitcoin-testnet\
 -v lnd-bitcoin-testnet-data:/home/lnd/.lnd/data/\
 -v lnd-bitcoin-testnet-logs:/home/lnd/.lnd/logs/\
 dmp1ce/lnd:latest\
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
