
#!/bin/sh -e
# This script runs benchmark tests in all the subpackages.

if [ -d "godeps" ]; then
  export GOPATH=`pwd`/godeps
fi

go test github.com/yoshrote/sync_gateway/... -bench='LoggingPerformance' -benchtime 1m -run XXX

go test github.com/yoshrote/sync_gateway/... -bench='RestApiGetDocPerformance' -cpu 1,2,4 -benchtime 1m -run XXX

go test github.com/yoshrote/sync_gateway/... -bench='RestApiPutDocPerformanceDefaultSyncFunc' -benchtime 1m -run XXX

go test github.com/yoshrote/sync_gateway/... -bench='RestApiPutDocPerformanceExplicitSyncFunc' -benchtime 1m -run XXX
