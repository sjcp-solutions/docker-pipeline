# Docker Pipeline Example

This repository shows the procedure for developing docker images within gitlab.
Once the image has been developed it will be released to github and docker hub.

## Gitlab Development

### Gitlab General Settings
* Merge Requests: *Fast-forward merge*
* Only allow merge requests to be merged if the pipeline succeeds

### Gitlab Repository Settings
#### Push Rule
Set the following rules:
* Do not allow users to remove git tags with git push
* Prevent committing secrets to Git
* Branch name: `(master|develop|feature|release)\/*`
* Commit author's email: `@sjcp-solutions.com$`
