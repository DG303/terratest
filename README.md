# terratest
## Description:
* A Terraform Module

## Services Created:

## Variables:
(examples can be found in testing.tfvars or variables.tf)
#### Required:

#### Optional:

## How to install

### 1. Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/terraform-docs/terraform-docs) required for `terraform_docs` hooks. `GNU awk` is required if using `terraform-docs` older than 0.8.0 with Terraform 0.12.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.
* [`TFSec`](https://github.com/liamg/tfsec) required for `terraform_tfsec` hook.
* [`coreutils`](https://formulae.brew.sh/formula/coreutils) required for `terraform_validate` hook on macOS (due to use of `realpath`).

##### MacOS

```bash
brew tap liamg/tfsec
brew install pre-commit gawk terraform-docs tflint tfsec coreutils
```

##### Ubuntu

```bash
sudo apt install python3-pip gawk &&\
pip3 install pre-commit
curl -L "$(curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep -o -E "https://.+?-linux-amd64")" > terraform-docs && chmod +x terraform-docs && sudo mv terraform-docs /usr/bin/
curl -L "$(curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" > tflint.zip && unzip tflint.zip && rm tflint.zip && sudo mv tflint /usr/bin/
env GO111MODULE=on go get -u github.com/liamg/tfsec/cmd/tfsec
```

### 2. Install the pre-commit hook globally

```bash
DIR=~/.git-template
git config --global init.templateDir ${DIR}
pre-commit init-templatedir -t pre-commit ${DIR}
```

## pre-commit

* Install the pre-commit package

```
brew install pre-commit gawk terraform-docs tflint tfsec coreutils
```

* Install the pre-commit hook

```
pre-commit install
```

## Inspec

* Install the required ruby gems

```
bundle install
```

* Run the module to create the aws resource

```
cd test
terraform init
terraform apply
```

* Run the Inspec tests

```
cd test
terraform output --json > tests/files/terraform.json
inspec exec --no-create-lockfile tests -t aws://
```

* Clean up test environment

```
cd test
terraform destroy
```

* Clean up test environment

```
kitchen destroy
```
![Run terraform graph | dot -Tsvg > terratest-graph.svg](./terratest-graph.svg)
