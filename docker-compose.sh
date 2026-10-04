sudo mkdir -p /usr/libexec/docker/cli-plugins
sudo curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose version


#buildx commands
mkdir -p /root/.docker/cli-plugins
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    ARCH="amd64"
elif [ "$ARCH" = "aarch64" ]; then
    ARCH="arm64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi
VERSION=$(curl -fsSL https://api.github.com/repos/docker/buildx/releases/latest \
    | grep '"tag_name":' | head -n 1 | cut -d '"' -f 4)
curl -fL \
    "https://github.com/docker/buildx/releases/download/${VERSION}/buildx-${VERSION}.linux-${ARCH}" \
    -o /root/.docker/cli-plugins/docker-buildx
chmod +x /root/.docker/cli-plugins/docker-buildx
