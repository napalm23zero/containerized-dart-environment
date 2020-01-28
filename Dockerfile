FROM google/dart

LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigodantas.91@gmail.com"
LABEL web="napalm23zero.github.io"

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
RUN pub global activate aqueduct
ADD . /app
RUN pub get --offline

EXPOSE 4000