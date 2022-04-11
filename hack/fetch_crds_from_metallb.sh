#!/bin/bash
. $(dirname "$0")/common.sh

METALLB_PATH=_cache/metallb

curl -L https://github.com/metallb/metallb/tarball/"$METALLB_COMMIT_ID" | tar zx -C _cache
rm -rf "$METALLB_PATH"
mv _cache/metallb-metallb-* "$METALLB_PATH"

# let's leave metallb
ls config/crd/bases | grep -v "metallb.io_metallbs.yaml" | xargs rm -f
cp "$METALLB_PATH"/config/crd/bases/*.yaml config/crd/bases

rm -rf "$METALLB_PATH"
