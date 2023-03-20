FROM docker:20.10.16

USER root

RUN apk --update --no-cache add curl git bash jq

RUN mkdir /git-semver
COPY git-semver/* /git-semver/
RUN /git-semver/install.sh

COPY set-semver.sh /usr/local/bin/set-semver.sh
COPY get-semver.sh /usr/local/bin/get-semver.sh
RUN chmod +x /usr/local/bin/set-semver.sh /usr/local/bin/get-semver.sh

CMD ["sleep", "infinity"]