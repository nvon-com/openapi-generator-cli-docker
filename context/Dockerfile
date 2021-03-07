# Extending openapitools/openapi-generator-cli by adding a non-root user.

FROM openapitools/openapi-generator-cli:v5.0.0

# take user and group id as build arguments in order
# to avoid permission problems
ARG USER_ID
ARG GROUP_ID

ENV APP_USER_AND_GROUP=javauser
ENV ENV_USER_ID=${USER_ID:-1001}
ENV ENV_GROUP_ID=${GROUP_ID:-1001}

# create group and user
RUN addgroup -g ${ENV_GROUP_ID} -S ${APP_USER_AND_GROUP}
RUN adduser \
  -u ${ENV_USER_ID} \
  -G ${APP_USER_AND_GROUP} \
  -S ${APP_USER_AND_GROUP}

# own openapi-generator-cli.jar
RUN chown ${APP_USER_AND_GROUP}:${APP_USER_AND_GROUP} \
  /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar

# create working directory
RUN mkdir /generated
RUN chown ${APP_USER_AND_GROUP}:${APP_USER_AND_GROUP} /generated

USER ${APP_USER_AND_GROUP}

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["help"]
