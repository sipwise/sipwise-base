# DOCKER_NAME=sipwise-base-jessie
FROM docker.mgm.sipwise.com/sipwise-jessie:latest

# Important! Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT 2018-01-12

RUN apt-get update && apt-get install --assume-yes libmodule-build-perl libtrycatch-perl libstrictures-perl

RUN echo "cd /code && ./t/testrunner" >/root/.bash_history

WORKDIR /code/

################################################################################
# Instructions for usage
# ----------------------
# When you want to build the base image from scratch
# (jump to the next section if you don't want to build yourself!):
#
# you need to put the proper NGCP sources at t/sources.list.d/builddeps.list
# for instance, trunk:
# echo "deb https://deb.sipwise.com/autobuild/ release-trunk-jessie main" > t/sources.list.d/builddeps.list
#
# NOTE: run the following command from root folder of git repository:
# % docker build --tag="sipwise-base-jessie" -f ./t/Dockerfile .
# % docker run --rm -i -t -v $(pwd):/code:rw sipwise-base-jessie:latest bash
#
# Use the existing docker image:
# % docker pull docker.mgm.sipwise.com/sipwise-base-jessie
# NOTE: run the following command from root folder of git repository:
# % docker run --rm -i -t -v $(pwd):/code:rw docker.mgm.sipwise.com/sipwise-base-jessie:latest bash
#
# Inside docker:
#   cd /code && ./t/testrunner
################################################################################
