```bash
docker build -t mbwali/xpra-desktop:22.04-wine .

docker push mbwali/xpra-desktop:22.04-wine

docker run mbwali/xpra-desktop:22.04-wine -p 9876:9876

```