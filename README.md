# Overview

Terraform playground using AWS (free tier) as the provider, and an
ubuntu vagrant machine

## Setup

Run the setup script and export AWS variables

    ./install_terraform.sh
    export AWS_DEFAULT_REGION=
    export AWS_SECRET_ACCESS_KEY=
    export AWS_ACCESS_KEY_ID=

## Commands


Start of new project / initialize working directory

    terraform init

Format/lint

    terraform fmt

Changes to be made

    terraform plan

Create or update infrastructure

    terraform apply

Running from subdirectory

    terraform -chdir=<dirname> {init,plan,apply}

Dependency graph

    terraform graph

Different ways to use variables

    terraform plan -var "server_port=8080"
    # or
    export TF_VAR_server_port=8080
    terrform plan

Output variables

    terraform output
    terraform output <VARIABLE_NAME>
    # also shows with apply
    terraform apply

## Syntax


```terraform
resource "<PROVIDER>_<TYPE>" <NAME> {
    [CONFIG ...]
}
```

- PROVIDER: name of the provider e.g. AWS
- TYPE: type of resource to create in that provider e.g. instance
- NAME: an identifier you can use throughout the terraform code

Resource attribute reference

For example, when creating a security group to be used with a resource. 

    <PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>

Defining input variables

```
variable "NAME" {
    [CONFIG ...]
}
```

parameters that can be used:
- description: document how variable will be used
- default: default value
- type: type constraints e.g. string, number, bool, list
- validation: validation rule e.g. min/max
- sensitive: don't log when running plan or apply, accepts bool

Using the variable

    var.<VARIABLE_NAME>

In string literal with interpolation

    ${<VARIABLE_NAME>}

Output variables

```
output "<NAME>" {
    value = <VALUE>
    [CONFIg ...]
}
```

Data source represents a piece of read-only information fetched from a provider

```
data "<PROVIDER>_<TYPE>" "<NAME>" {
    [CONFIG ...]
}
```

PROVIDER: e.g. aws
TYPE: e.g. vpc

Example call

    data.aws_vpc.default.id

Life cycle settings

    create_before_destroy
    prevent_destroy
