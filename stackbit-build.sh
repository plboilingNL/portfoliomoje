#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e08eeb96828f80019256bc7/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e08eeb96828f80019256bc7
curl -s -X POST https://api.stackbit.com/project/5e08eeb96828f80019256bc7/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e08eeb96828f80019256bc7/webhook/build/publish > /dev/null
