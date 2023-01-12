# Install Docker and Portainer

Update the apt package index and install packages to allow apt to use a repository over HTTPS:

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
```

Add Docker’s official GPG key:

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Use the following command to set up the repository:

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Update the apt package index, and install the latest version of Docker Engine, containerd, and Docker Compose, or go to the next step to install a specific version:

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

If you receive a GPG error when running `apt-get update`, run the following command and then try to update your repo again:

```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Docker provides a convenience script at get.docker.com to install Docker into development environments quickly and non-interactively

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

Install portainer at 9443 port to acess the containers remotely

```bash
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest
```

The portainer is running at <http://localhost:9443/>. To remote access, change the localhost to ip address of server. Enter in link to configure portainer to manager the docker remotely.


To install lareferencia, run the following command, REMEMBER TO CHANGE USER AND PASSWORD:

```bash
  cd /opt
  git clone https://<user>:<password>@github.com/lareferencia/lareferencia-docker.git
  cd lareferencia-docker
  cd lareferencia
  ./docker-compose.sh build
  docker exec -ti lareferencia_lareferencia_1 bash
  ./installcode.sh
  ./docker-compose.sh permissions
  chmod -R 777 /opt/lareferencia-docker/
  exit
```

The kibana is running at <http://localhost:5601/>. To remote access change the localhost to ip address of server.

The elastic search is running a <http://localhost:9200/>. to remote access change the localhost to ip address of server.

Testing code:

```bash
docker exec -ti lareferencia_lareferencia_1 bash
/home/lareferencia/codigo/lrharvester/lareferencia-entity-shell/entity-shell.jar
database_info
```

The example of output is:

| Category  | Version | Description                        | Type | Installed On        | State   |
|-----------|---------|------------------------------------|------|---------------------|---------|
| Versioned | 1       | Initialize db                      | SQL  | 2022-07-28 14:47:24 | Success |
| Versioned | 4.0.0   | Entities initialization            | SQL  | 2022-07-28 14:47:25 | Success |
| Versioned | 4.0.1   | NetworkTablesMigrationFromV3.X     | SQL  | 2022-07-28 14:47:26 | Success |
| Versioned | 4.0.2   | OAIRecordTablesMigrationFromV4.0.1 | SQL  | 2022-07-28 14:47:26 | Success |
| Versioned | 4.0.3   | New Entity Model                   | SQL  | 2022-07-28 14:47:26 | Success |
| Versioned | 4.0.4   | Entity Model Optimization          | SQL  | 2022-07-28 14:47:26 | Success |

## For devs

Install the extension [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) in VS Code to connect to the container.
