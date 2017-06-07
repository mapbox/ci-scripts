# Contributing

General guidelines for contributing to ci-scripts

## Releasing

To release a new ci-scripts version:

 - Make sure that **all tests are passing** (including travis and appveyor) **for all _affected_ repositories**.
 - Currently
   - node
     - [node-zipfile](https://github.com/mapbox/node-zipfile)
     - [node-sqlite3](https://github.com/mapbox/node-sqlite3)
     - [node-mbtiles](https://github.com/mapbox/node-mbtiles)
     - [node-gdal](https://github.com/naturalatlas/node-gdal)
     - [node-srs](https://github.com/mapbox/node-srs)
 - Update the [CHANGELOG.md](CHANGELOG.md)
 - Create a github tag like `git tag -a v0.8.5 -m "v0.8.5" && git push --tags`
 - Ensure travis tests are passing
 - Update all affected repositories to use the new tag
 