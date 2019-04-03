# Vera's Analysis
# Build with: docker build --rm -t veraanalysis .
# Run with: docker run -v `pwd`:/vera -p 8888:8888 -it veraanalysis bash

FROM ubuntu:18.04

CMD ["bash", "c"]

# Python 3.6 & Pipenv:
ENV PYENV_ROOT="/root/.pyenv" \
	PATH="/root/.pyenv/shims:/root/.pyenv/bin:${PATH}" \
	PIPENV_YES=1 \
	PIPENV_DONT_LOAD_ENV=1 \
	LC_ALL="C.UTF-8" \
	LANG="en_US.UTF-8"
RUN apt-get update && apt-get install -yq \
  build-essential git libreadline-dev zlib1g-dev libssl-dev libbz2-dev libsqlite3-dev libffi-dev jq curl \
  && curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash \
  && pyenv install 3.6.7 && pyenv global 3.6.7 && pyenv rehash && pip install --upgrade pip


# Add jupyter config to be able to start a server
ADD .jupyter /root/.jupyter

# Pip install any python packages I want to keep track of
ADD /requirements.txt /tmp
RUN cd /tmp && pip install -r requirements.txt

# Copy everything from this directory
ADD / /vera

WORKDIR /vera/analyses