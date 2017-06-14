#!/bin/bash
set -x
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# setup constants
REPO="xirixiz.github.io"
GH_REPO="github.com/xirixiz/${REPO}.git"
MSG=$(git log -1 --oneline)
git config --global user.email "spam@rootrulez.com"
git config --global user.name "Travis CI"

# Build the project.
hugo -t hugo-sustain
ls -al public

git clone "https://$GH_REPO"
cd ${REPO} && rm -rf *
ls -al ../public
cd .. && cp -r public/* ${REPO}
ls -al ${REPO}
cd ${REPO}

#git remote
#git add -A :/
git add -A
git commit -a -m "via travis -- for $MSG"
git push "https://${GH_TOKEN}@${GH_REPO}" master > /dev/null 2>&1

#git clone "${GIT_DEPLOY_REPO}"
#git push "${GIT_DEPLOY_REPO}" master > /dev/null 2>&1
