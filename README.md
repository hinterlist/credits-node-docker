# Credits node

## Setting up account

To attach your existing account to node you need to create pair of two files:

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
  csnode:
    image: credits-node
    ports:
      - "6000:6000"
      - "9090:9090"
      - "9080:9080"
    container_name: "csnode"
    volumes:
      - "~/.credits/db:/opt/node/test_db"
      - "~/.credits/NodePublic.txt:/opt/node/NodePublic.txt"
      - "~/.credits/NodePrivate.txt:/opt/node/NodePrivate.txt"
```

### Usign CLI

```
docker run credits-node \
    --name csnode \
    --port 6000:600 \
    --port 9090:9090 \
    --port 9080:9080 \
    --volume ~/.credits/db:/opt/node/test_db \
    --volume ~/.credits/NodePublic.txt:/opt/node/NodePublic.txt \
    --volume ~/.credits/NodePrivate.txt:/opt/node/NodePrivate.txt \
```
