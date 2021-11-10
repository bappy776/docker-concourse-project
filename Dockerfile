# Download the Alpine image from dockerhub
FROM alpine:3.12

# Installing Package we need 
RUN apk update && apk add vim curl wget nginx

# Adding user
RUN addgroup -S user1 && adduser -S user1 -G user1

# Copy our script from our laptop 
COPY ./bappy.sh bappy.sh
RUN ["chmod", "+x", "./bappy.sh"]

# Telling the Micro service who the user and where to star kicking 
USER user1
ENTRYPOINT ["/bin/sh", "./bappy.sh"]
