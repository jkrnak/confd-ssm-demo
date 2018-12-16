#!/bin/sh

confd -onetime -backend ssm --prefix /${ENVIRONMENT} -node https://ssm.${AWS_DEFAULT_REGION}.amazonaws.com

exec $@
