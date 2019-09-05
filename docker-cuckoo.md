# docker-cuckoo作業ログ

## Virtualboxにcuckoo用のVMを立てる

```
$ docker-machine create --driver virtualbox default
```

virtualboxにdefaultという名前でVMが作成できたことを確認する


## VMを一旦ストップし、Virtualboxのメモリ設定をいじる

```
$ docker-machine stop
```

実行中から電源OFFになったことを確認し、Virtualboxの設定からメモリを１Gからあげる

自分は４G割り当てる

## VMをスタートし、SSHで接続したあとカーネル設定で最大値をいじる

```
$ docker-machine start
```

defaultが実行中であることを確認する

```
$ docker-machine ssh

docker@default:~$ sudo sysctl -w vm.max_map_count=262144

docker@default:~$ exit
```

これをやらないと、ElasticSearchでここらへんが落ちる

## docker-cuckooのスタート

```
$ eval $(docker-machine env)
$ git clone https://github.com/blacktop/docker-cuckoo
$ cd docker-cuckoo
$ docker-compose up -d
$ curl $(docker-machine ip):8000/cuckoo/status
```
