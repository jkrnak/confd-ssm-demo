# AWS SSM, confd demo

A demo project that uses confd to generate config files for applications. It uses the AWS SSM Parameter Store as backend.

## Requirements

 - docker
 - docker-compose

### Parameters in SSM

You can generate the example parameters in SSM with the following commands, just make sure you have set the `AWS_PROFILE` environment variable before you run them.

```bash
aws ssm put-parameter --name /dev/client-api/database/user --value client --type String
aws ssm put-parameter --name /dev/client-api/database/password --value p@ssw0rd --type SecureString
```

## The containers

Check the `docker-compose.yaml`, it mounts up the `target` directory, where the templates will be generated, it also mounts up your `~/.aws` folder so it can use the credentials. The container is passing in the `AWS_PROFILE` variable which is then going to be used by `confd` to authenticate.

The default AWS region the examples are using is `eu-west-1 (Ireland)`.

The `awscli` container is not used for anything, it's just there to compare the size against the `confd` one. At the time I was testing the size difference was about 100MB.

## Start the projects

Just run
```bash
docker-comopse up --build
```

The template files will be generated in the `target` folder.
