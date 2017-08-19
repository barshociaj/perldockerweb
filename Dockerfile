# DOCKER-VERSION 0.3.4
FROM        perl:latest
MAINTAINER  Robert Norris rob@eatenbyagrue.org

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

RUN cachebuster=907bdf2 git clone https://github.com/barshociaj/perldockerweb.git
RUN cd perldockerweb && carton install --deployment

EXPOSE 8080

WORKDIR perldockerweb
CMD carton exec starman --port 8080 bin/app.pl
