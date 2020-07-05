## [LND](https://github.com/LightningNetwork/lnd) Docker Images

See [dmp1ce/lnd](https://hub.docker.com/r/dmp1ce/lnd/tags/) on Docker Hub for available images.

## Tags

- `0.10.1-beta`, `0.10-beta`, `latest` ([DebianDockerfile.release](https://github.com/dmp1ce/lnd-docker/blob/v0.10.1-beta/DebianDockerfile.release))
- `0.10.1-beta-alpine`, `0.10-beta-alpine`, `alpine` ([AlpineDockerfile.release](https://github.com/dmp1ce/lnd-docker/blob/v0.10.1-beta/AlpineDockerfile.release))
- `dev` ([DebianDockerfile](https://github.com/dmp1ce/lnd-docker/blob/master/DebianDockerfile))
- `dev-alpine` ([AlpineDockerfile](https://github.com/dmp1ce/lnd-docker/blob/master/AlpineDockerfile))

**Picking the right tag**

- `dmp1ce/lnd:latest`: points to the latest stable release available of LND built with a Debian base.
- `dmp1ce/lnd:alpine`: points to the latest stable release avilable of LND built with an Alpine base.
- `dmp1ce/lnd:<version>`: based on a slim Debian image, points to a specific version branch or release.
- `dmp1ce/lnd:<version>-alpine`: based on Alpine Linux, points to a specific version branch or release. Uses a simple, resource efficient Linux distribution with security in mind.

Using `latest` or `alpine` will keep LND up to date but be careful of migrations causing an issue from version to version. Use specific versions to avoid unexpected updates.

Build yourself if the latest code is needed. For example `docker build --file DebianDockerfile ./`. `dev` and `dev-alpine` development builds are available but not guaranteed to be the latest code.

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
