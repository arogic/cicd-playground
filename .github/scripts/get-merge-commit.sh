git remote set-url origin https://x-access-token:${GITHUB_ACTIONS_TOKEN}@github.com/arogic/cicd-playground.git
git config --global user.email "a.rogic@gmail.com"
git config --global user.name "arogic"
git checkout -b "${GIT_BRANCH}"
echo "Test" >> test/README.md
git add test/*
git commit -m "chore: updated test readme"
git push --set-upstream origin "${GIT_BRANCH}"
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr create --fill --base "${GIT_BASE_BRANCH}" | tee -a ./output.txt
cat ./output.txt
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr merge --rebase --auto
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr review --approve
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr view "${GIT_BRANCH}" --json mergeCommit | jq -r .mergeCommit.oid > ./git-commit.txt
ls -ltr ./git-commit.txt
cat ./git-commit.txt
PR_MERGE_COMMIT=$(cat ./git-commit.txt)
echo "PR_MERGE_COMMIT: ${PR_MERGE_COMMIT}"
echo "VERSION: ${VERSION}"
git pull
git tag -a ${VERSION} -m "${VERSION}" ${PR_MERGE_COMMIT}
git push --tags
