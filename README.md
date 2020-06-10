# node-terraform-beanstalk

[![CircleCI](https://circleci.com/gh/blairnangle/node-terraform-beanstalk.svg?style=shield)](https://app.circleci.com/pipelines/github/blairnangle/node-terraform-beanstalk)

Node Docker image with Python 3, pip, Terraform, Checkov, the AWS CLI tool and Elastic Beanstalk CLI. See 
[`Dockerfile`](./Dockerfile) for exact versions.

Written with the intention of creating a single, consistent CircleCI container image for Node applications that 
deploy their infrastructure with Terraform in the same pipeline (but are not necessarily deployed as containerized
applications).

Published via CircleCI to 
[Docker Hub](https://hub.docker.com/repository/docker/blairnangle/node-terraform-beanstalk).

## License

Distributed under [MIT License](./LICENSE).
