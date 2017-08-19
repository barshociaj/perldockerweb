# Perl Docker Web

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

## deployment

### IBM Bluemix

The following is a short version of the tutorial at: https://console.bluemix.net/docs/containers/cs_tutorials.html#cs_tutorials

Install Bluemix CLI https://clis.ng.bluemix.net/ui/home.html

```bash
$ bx plugin install container-service -r Bluemix
$ bx login -a api.eu-gb.bluemix.net
```

Install Kubernetes CLI https://kubernetes.io/docs/tasks/tools/install-kubectl/

```bash
$ bx plugin install container-registry -r Bluemix
$ bx plugin list
```

Install Docker CE CLI: https://www.docker.com/community-edition#/download

```bash
$ bx cs cluster-create --name CLUSTERNAME
$ bx target -o ORGNAME -s SPACENAME
$ bx cr namespace-add NAMESPACENAME
$ bx cs cluster-config CLUSTERNAME
$ export KUBECONFIG=/Users/............ <from previous command>
$ echo $KUBECONFIG
$ kubectl version  --short
$ bx cr login
```

```bash
$ docker build -t registry.eu-gb.bluemix.net/NAMESPACENAME/perldockerweb:1 .
$ docker push registry.eu-gb.bluemix.net/NAMESPACENAME/perldockerweb:1
$ bx cr images
$ kubectl run perldockerweb-deployment --image=registry.eu-gb.bluemix.net/NAMESPACENAME/perldockerweb:1
$ kubectl expose deployment/perldockerweb-deployment --type=NodePort --port=8080 --name=perldockerweb-service --target-port=8080
$ kubectl describe service perldockerweb-service
$ bx cs workers CLUSTERNAME
```

Get IP address and NodePort from previous commands to see the app at http://IPADDRESS:NODEPORT

```bash
$ kubectl proxy
```

View Kubernetes status at http://localhost:8001/ui
