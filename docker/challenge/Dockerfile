FROM ubuntu:xenial

RUN apt update \
  && apt -y install build-essential git wget inotify-tools

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb

RUN apt update

RUN apt install -y esl-erlang elixir

RUN yes Y | mix local.hex