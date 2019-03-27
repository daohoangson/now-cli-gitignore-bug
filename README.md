# [now](https://github.com/zeit/now-cli/) dev .gitignore bug
This repo demonstrate a bug in `now dev` during .gitignore processing.
Reported at https://github.com/zeit/now-cli/issues/2021

## Steps

1. `./docker.sh`: start Docker image `node:10.15.3-alpine` with `now-alpine` downloaded from https://latest-now-cli.now.sh
1. `./dev.sh` (within container): run `now dev`

## Expected

It works e.g. `http://localhost:3000/src/test` returns http 200.

## Actual

```
> [debug] [2019-03-27T01:37:08.701Z] Found config in file /app/now.json
> [debug] [2019-03-27T01:37:09.341Z] Using Now CLI 14.3.0-canary.17
> [debug] [2019-03-27T01:37:09.354Z] user supplied known subcommand
> Success! Dev server listening on port 3000
> [debug] Initial build
> [debug] Build {"src":"src/*/index.ts","use":"@now/node"}
> [debug] Building /app/src/test/index.ts (workPath = /root/.cache/co.zeit.now/dev/workPaths/17524244)
downloading user files...
installing dependencies for user's code...
installing to /root/.cache/co.zeit.now/dev/workPaths/17524244/user/src/test
yarn install v1.13.0
info No lockfile found.
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
Done in 0.20s.
yarn cache v1.13.0
success Cleared cache.
Done in 0.08s.
writing ncc package.json...
installing dependencies for ncc...
installing to /root/.cache/co.zeit.now/dev/workPaths/17524244/ncc
yarn install v1.13.0
info No lockfile found.
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
Done in 2.89s.
yarn cache v1.13.0
success Cleared cache.
Done in 0.13s.
running user script...
compiling entrypoint with ncc...
> Error! Cannot read property 'fsPath' of undefined
> [debug] [2019-03-27T01:37:22.221Z] TypeError: Cannot read property 'fsPath' of undefined
    at /root/.cache/co.zeit.now/dev/builders/node_modules/@now/node/dist/index.js:59:51
    at Generator.next (<anonymous>)
    at /root/.cache/co.zeit.now/dev/builders/node_modules/@now/node/dist/index.js:7:71
    at new Promise (<anonymous>)
    at __awaiter (/root/.cache/co.zeit.now/dev/builders/node_modules/@now/node/dist/index.js:3:12)
    at compile (/root/.cache/co.zeit.now/dev/builders/node_modules/@now/node/dist/index.js:58:12)
    at Object.<anonymous> (/root/.cache/co.zeit.now/dev/builders/node_modules/@now/node/dist/index.js:88:37)
    at Generator.next (<anonymous>)
    at fulfilled (/root/.cache/co.zeit.now/dev/builders/node_modules/@now/node/dist/index.js:4:58)
```
