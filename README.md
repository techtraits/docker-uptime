docker-uptime
=============

A dockerized [Uptime](https://github.com/fzaninotto/uptime) Container

## Usage

```
# Run MongoDB
docker run -d --name mongodb dockerfile/mongodb

# Run Uptime and link MongoDB
docker run -d -p 8082:8082 --name uptime --link mongodb:mongodb -i -t usman/docker-uptime

# Run Uptime and link MongoDB with custom Database Password
docker run -d -p 8082:8082 --name uptime --link mongodb:mongodb -i -t usman/docker-uptime <DB Password>
```
Then point your browser at [http://localhost:8082/](http://localhost:8082/)

or [http://192.168.59.103:8082/](http://192.168.59.103:8082/) if you are using boot2docker

## Building

To build the image, simply invoke

    docker build github.com/techtraits/docker-uptime

A prebuilt container is also available in the docker index

    docker pull usman/docker-uptime
    
## Author

  * Usman Ismail (<usman@techtraits.com>)

## LICENSE

Copyright 2014 Usman Ismail

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
