git remote set-url origin https://x-access-token:${GITHUB_ACTIONS_TOKEN}@github.com/arogic/cicd-playground.git
git config --global user.email "a.rogic@gmail.com"
git config --global user.name "arogic"
git checkout -b "${GIT_BRANCH}"
echo "Test 9" >> test/README.md
git add test/*
git commit -m "chore: updated test readme"
git push --set-upstream origin "${GIT_BRANCH}"
echo "Creating Pull Request"
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr create --fill --base "${GIT_BASE_BRANCH}" | tee -a ./output.txt
echo "Output of Creating Pull Request"
cat ./output.txt
echo "Pull Request Number"
cat ./output.txt | sed 's/[^0-9]*//g'
PR_NUMBER=$(cat ./output.txt | sed 's/[^0-9]*//g')
echo "PR_NUMBER: ${PR_NUMBER}"
echo "Merging Pull Request"
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr merge --rebase --auto
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr review --approve
sleep 20
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr view "${GIT_BRANCH}" --json mergeCommit | jq -r .mergeCommit.oid > ./git-commit.txt
ls -ltr ./git-commit.txt
cat ./git-commit.txt
PR_MERGE_COMMIT=$(cat ./git-commit.txt)
echo "PR_MERGE_COMMIT: ${PR_MERGE_COMMIT}"
echo "VERSION: ${VERSION}"
echo "SHOW COMMIT SHA"
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr list -s closed -S "${PR_NUMBER}" --json mergeCommit | jq -r '.[0].mergeCommit.oid'
# git pull
git tag -a ${VERSION} -m "${VERSION}" ${PR_MERGE_COMMIT}
git push --tags
