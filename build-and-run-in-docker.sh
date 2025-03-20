#!/bin/sh

docker build --no-cache .

echo ""
echo "#-#-#-#-#-#"
echo "#-#-#-#-#-# Build complete, run it:"
echo "#-#-#-#-#-#"
echo ""

# Although this uses LD_LIBRARY_PATH I've also tried to add the dir to /etc/ld.so.conf.d/ and running ldconfig to detect it (verified it is found and of the expected type via ldconfig -p)
docker run --rm -i -t $(docker image ls --quiet | head -1) env LD_LIBRARY_PATH="./node_modules/libxl/deps/libxl/lib64/" NODE_LIBXL_PATH=./ node demo

echo ""
echo "#-#-#-#-#-#"
echo "#-#-#-#-#-# Run test complete"
echo "#-#-#-#-#-# Cleanup that test image with: docker image rm \$\(docker image ls --quiet | head -1\)"
echo "#-#-#-#-#-#"

# For me results in:
#
#/app/demo.js:67
#var xlsBook =  new xl.Book(xl.BOOK_TYPE_XLS),
#               ^
#
#TypeError: xl.Book is not a constructor
#    at Object.<anonymous> (/app/demo.js:67:16)
#    at Module._compile (node:internal/modules/cjs/loader:1565:14)
#    at Object..js (node:internal/modules/cjs/loader:1708:10)
#    at Module.load (node:internal/modules/cjs/loader:1318:32)
#    at Function._load (node:internal/modules/cjs/loader:1128:12)
#    at TracingChannel.traceSync (node:diagnostics_channel:322:14)
#    at wrapModuleLoad (node:internal/modules/cjs/loader:219:24)
#    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:170:5)
#    at node:internal/main/run_main_module:36:49
#
#Node.js v22.12.0

