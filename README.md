Perl Web application template for dockerising

## setup

### docker

```bash
$ docker build -t barshociaj/perldockerweb .
$ docker run --name=perldockerweb -d -p 8080:8080 barshociaj/perldockerweb
```

### Existing Perl with Carton & Starman

```bash
$ git clone https://github.com/barshociaj/perldockerweb.git
$ cd perldockerweb
$ curl -L http://cpanmin.us | perl - Carton
$ carton install --deployment
$ carton exec starman --port 8080 bin/app.pl
```

### Existing Perl with Carton & Plack

```bash
$ git clone https://github.com/barshociaj/perldockerweb.git
$ cd perldockerweb
$ curl -L http://cpanmin.us | perl - Carton
$ carton install --deployment
$ carton exec plackup bin/app.pl
```
