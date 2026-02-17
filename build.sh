#!/bin/bash
set -e

rm -rf dist
mkdir dist

cp app.py dist/
cp requirements.txt dist/

zip -r app-build.zip dist/
