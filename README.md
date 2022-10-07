# cicd-playground

<!-- [![Terraform](https://github.com/arogic/cicd-playground/actions/workflows/terraform.yml/badge.svg)](https://github.com/arogic/cicd-playground/actions/workflows/terraform.yml) -->

[![Terraform Pull Request](https://github.com/arogic/cicd-playground/actions/workflows/terraform-pr-workflow.yml/badge.svg)](https://github.com/arogic/cicd-playground/actions/workflows/terraform-pr-workflow.yml)

Github CLI Info:
<https://cli.github.com/manual/>

```bash
git checkout -b test-pr
# Update README.md
echo -n "GITHUB_PERSONAL_ACCESS_TOKEN" | gh auth login --with-token
gh pr create --title "updated readme" --body "Added github cli command to login"
gh pr merge test-pr -m
```

