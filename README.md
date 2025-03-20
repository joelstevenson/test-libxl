# Simple Dependency Use xl.Book Error

Uses Node v22.12.0

The only dependency is libxl.

Attempting to use the demo.js script from libxl, changing only the `require()` to see if libxl is working after install.

## Direct/local build in MacOS Sequoia

```shell

npm install

env NODE_LIBXL_PATH=./ node demo
/Users/jstevenson/projects/test-libxl/demo.js:67
var xlsBook =  new xl.Book(xl.BOOK_TYPE_XLS),
               ^

TypeError: xl.Book is not a constructor
    at Object.<anonymous> (/Users/jstevenson/projects/test-libxl/demo.js:67:16)
    at Module._compile (node:internal/modules/cjs/loader:1565:14)
    at Object..js (node:internal/modules/cjs/loader:1708:10)
    at Module.load (node:internal/modules/cjs/loader:1318:32)
    at Function._load (node:internal/modules/cjs/loader:1128:12)
    at TracingChannel.traceSync (node:diagnostics_channel:322:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:219:24)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:170:5)
    at node:internal/main/run_main_module:36:49

Node.js v22.12.0


```

## Or in Linux (build and run in ubuntu node22 docker container)

```shell
% ./build-and-run-in-docker.sh                        
[+] Building 29.5s (13/13) FINISHED                                                                                                                                                                                                                      docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                     0.0s
 => => transferring dockerfile: 744B                                                                                                                                                                                                                                     0.0s
 => [internal] load metadata for public.ecr.aws/docker/library/node:22.12.0-bookworm                                                                                                                                                                                     0.6s
 => [internal] load .dockerignore                                                                                                                                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                          0.0s
 => CACHED [1/8] FROM public.ecr.aws/docker/library/node:22.12.0-bookworm@sha256:0e910f435308c36ea60b4cfd7b80208044d77a074d16b768a81901ce938a62dc                                                                                                                        0.0s
 => [internal] load build context                                                                                                                                                                                                                                        0.0s
 => => transferring context: 2.18kB                                                                                                                                                                                                                                      0.0s
 => [2/8] RUN apt-get update && apt-get install -y vim                                                                                                                                                                                                                   3.5s
 => [3/8] WORKDIR /app                                                                                                                                                                                                                                                   0.0s 
 => [4/8] COPY ./lib /app/lib                                                                                                                                                                                                                                            0.1s 
 => [5/8] COPY ./package.json /app/                                                                                                                                                                                                                                      0.0s 
 => [6/8] COPY ./demo.js /app/                                                                                                                                                                                                                                           0.0s 
 => [7/8] COPY ./specs /app/specs                                                                                                                                                                                                                                        0.0s 
 => [8/8] RUN npm install                                                                                                                                                                                                                                               24.8s 
 => exporting to image                                                                                                                                                                                                                                                   0.4s
 => => exporting layers                                                                                                                                                                                                                                                  0.4s
 => => writing image sha256:cf00c2bdd70098691a18ea18cee225f112ae6714c5ea965f2b9ef427767c486e                                                                                                                                                                             0.0s 

Whats next:
    View a summary of image vulnerabilities and recommendations → docker scout quickview 

#-#-#-#-#-#
#-#-#-#-#-# Build complete, run it:
#-#-#-#-#-#

/app/demo.js:67
var xlsBook =  new xl.Book(xl.BOOK_TYPE_XLS),
               ^

TypeError: xl.Book is not a constructor
    at Object.<anonymous> (/app/demo.js:67:16)
    at Module._compile (node:internal/modules/cjs/loader:1565:14)
    at Object..js (node:internal/modules/cjs/loader:1708:10)
    at Module.load (node:internal/modules/cjs/loader:1318:32)
    at Function._load (node:internal/modules/cjs/loader:1128:12)
    at TracingChannel.traceSync (node:diagnostics_channel:322:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:219:24)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:170:5)
    at node:internal/main/run_main_module:36:49

Node.js v22.12.0

#-#-#-#-#-#
#-#-#-#-#-# Run test complete
#-#-#-#-#-# Cleanup that test image with: docker image rm $\(docker image ls --quiet | head -1\)
#-#-#-#-#-#


```
