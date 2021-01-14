# Extending openapitools/openapi-generator-cli by adding a non-root user.

FROM openapitools/openapi-generator-cli:v5.0.0

ENV APP_USER_AND_GROUP=javauser
ENV USER_AND_GROUP_ID=1000

RUN addgroup -g ${USER_AND_GROUP_ID} -S ${APP_USER_AND_GROUP}
RUN adduser -u ${USER_AND_GROUP_ID} -G ${APP_USER_AND_GROUP} -S ${APP_USER_AND_GROUP}

RUN chown ${APP_USER_AND_GROUP}:${APP_USER_AND_GROUP} \
  /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar

RUN mkdir /generated
RUN chown ${APP_USER_AND_GROUP}:${APP_USER_AND_GROUP} /generated

USER ${APP_USER_AND_GROUP}

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["help"]
