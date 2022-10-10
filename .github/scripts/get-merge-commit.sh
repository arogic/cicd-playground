GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr create --fill --base "${GIT_BASE_BRANCH}"
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr merge --rebase --auto
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr review --approve
GITHUB_TOKEN=$GITHUB_ACTIONS_TOKEN gh pr view "${GIT_BRANCH}" --json mergeCommit | jq -r .mergeCommit.oid > ./git-commit.txt
ls -ltr ./git-commit.txt
cat ./git-commit.txt
PR_MERGE_COMMIT=$(cat ./git-commit.txt)
echo "PR_MERGE_COMMIT: ${PR_MERGE_COMMIT}"
git tag -a ${VERSION} -m "${VERSION}" ${PR_MERGE_COMMIT}
git push --tags
