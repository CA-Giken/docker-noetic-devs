# Docker-noetic(ROS1) with various Devices

## Available devices
1. Ensenso camera
2. RoVI(YOODS)
3. Phoxi(Photoneo)

## Install docker on Linux-Mint

### Step0. コンフリクトの可能性のあるパッケージを削除

```sh
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

### Step1. Docker の apt レポジトリを追加

```sh
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
```

### Step2. Docker インストール

```sh
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

##  トラブルシューティング

1. docker compoe upに失敗する
~~~
Dockerfile:1
---------------------------------------------------------------------------
   1 | >>> FROM ghcr.io/ca-giken/rosnoetic-base:main
   2
   3
---------------------------------------------------------------------------
failed to solve: failed to register layer: archive/tar: invalid tar header
~~~
containerdバージョンが古いことで起きる。upgradeで対応
~~~
sudo apt upgrade
~~~

2. sudoでないと実行できない  
スーパーユーザー権限でなくても`docker`コマンドを実行できるように`docker`ユーザーグループに追加します。

```
sudo usermod -aG docker ros
```

この後、リブートする。
