# ElasticSearch-Kibana-docker-compose

## 概要

ElasticSearchとKibanaをdocker-composeを用いて立ち上げるためのサンプルです。

## 事前準備

カーネルの設定にて、変更が必要

- Linux

```
$ sudo sysctl -w vm.max_map_count=262144
```

- macOS and Windows

docker-machineを用いて変更を行う

```
$ docker-machine ssh
$ sudo sysctl -w vm.max_map_count=262144
```

## 実行方法

```
$ git clone git@github.com:yuk1h1ra/ElasticSearch-Kibana-docker-compose.git
$ cd ElasticSearch-Kibana-docker-compose
$ docker-compose up
```
