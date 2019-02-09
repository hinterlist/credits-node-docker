**NOTE:** This image use Test-Net v4.1

## Quick reference

- **Information about this project:**\
  [Official website of Credits](https://credits.com/)

- **Where to get help:**\
  [Official telegram group](https://t.me/creditscom)

- **Source code of this image**\
  [The source code is available on GitHub](https://github.com/dimitrykislichenko/credits-node-docker)

## What is Credits?

The fastest and most scalable blockchain platform for dApps

## Setting up account

To attach your existing account to node you need to create pair of files:

- ~/.credits/NodePublic.txt - your public key
- ~/.credits/NodePrivate.txt - your private key

After that restart node container if it's already running:

```
docker restart csnode
```

## Running node

### Using docker-compose

```
version: "3"
services:
  credits:
    image: dimitrykislichenko/credits
    ports:
      - "6000:6000"
      - "9090:9090"
      - "9080:9080"
    container_name: "credits"
    volumes:
      - "~/.credits/db:/opt/node/test_db"
      - "~/.credits/NodePublic.txt:/opt/node/NodePublic.txt"
      - "~/.credits/NodePrivate.txt:/opt/node/NodePrivate.txt"
```

### Usign CLI

```
docker run -d \
    --name credits \
    --publish 6000:600 \
    --publish 9090:9090 \
    --publish 9080:9080 \
    --volume ~/.credits/db:/opt/node/test_db \
    --volume ~/.credits/NodePublic.txt:/opt/node/NodePublic.txt \
    --volume ~/.credits/NodePrivate.txt:/opt/node/NodePrivate.txt \
    dimitrykislichenko/credits
```
