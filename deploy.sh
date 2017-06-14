#!/bin/bash
set -x

REPO="xirixiz.github.io"
GH_REPO="github.com/xirixiz/${REPO}.git"
MSG=$(git log -1 --oneline)

git config --global user.email "spam@rootrulez.com"
git config --global user.name "Travis CI"

echo "Cloning target repository"
git clone "https://$GH_REPO" public

echo "Running hugo"
hugo
ls -al public

echo "Publishing to branch"
cd public
git add -A .
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://$GH_REPO" master:master

echo "Done"
