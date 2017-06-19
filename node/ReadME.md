# AppVeyor

`appveyor.yml`s of each repository should contain the absolute minimum information/processing necessary.

eg.: just build matrix and environment variables needed for building/publishing.

All builds should download the centralised **versioned** build scripts of this repository and then execute them, eg.:

```yml
install:
  - ps: Start-FileDownload 'https://github.com/mapbox/ci-scripts/raw/v1.1.0/node/ci-js.bat' -FileName ci.bat
  - CALL ci.bat

build: OFF
test: OFF
deploy: OFF
```

## js-only

Use raw url (**including the tag/version**) to [`ci-js.bat`](ci-js.bat)

eg.: https://github.com/mapbox/ci-scripts/raw/v1.1.0/node/ci-js.bat

## cpp

Use raw url (**including the tag/version**) to [`ci-cpp.bat`](ci-cpp.bat)

eg.: https://github.com/mapbox/ci-scripts/raw/v1.1.0/node/ci-cpp.bat

### build failures with `node@4 x86`

`node@4 x86` builds kept failing with
```
gyp ERR! stack Error: ENOENT: no such file or directory, open 'C:\projects\node-pre-gyp\test\app1\undefined'
```

We used to workaround that by changing npm settings for `cafile` which is a nasty hack and only usable for one time ci builds as it may interfere with npm functioning properly afterwards.

**The correct way to solve this problem is to either run**

```
npm install node-gyp@3.6`
```

**manually before building or put**

```
"node-gyp": "^3.6.1"
```

**into the `devDependencies` of the `package.json`.**

# publishing for a single node version


Procedure:
* Change build matrix in `appveyor.yml` to just include the desired node version
* Commit with `[publish binary]`
* Revert build matrix
