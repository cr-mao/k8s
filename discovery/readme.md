## 服务发现

### pod直接 hostPort

ps:没这么用的

```shell
kubectl apply -f 01pod_web.yaml
```

我这里只会调度到k8snode1这个节点 http://192.168.56.81:30080



### 基于service hostport

```shell
kubectl apply -f 02svc_web_nodeport.yaml
```

### loadBalancer

基于这个实现 https://github.com/metallb/metallb

https://metallb.universe.tf/installation/

开启ipvs

```shell
helm repo add metallb https://metallb.github.io/metallb
helm pull metallb/metallb
tar zxvf metallb-0.14.3.tgz
cd metallb 
helm install metallb . -n metallb-system --create-namespace --debug
```


```shell
kubectl apply -f 03svc_web_loadbalancer.yaml
```



### ingress

ingress 就是规则，

ingress controller 就是实际的 如nginx 这样的 服务

ingress class 是 ingress yaml上指定用哪个ingress class, ingress class 会去指定用哪个ingress controller.


```shell
# 这个只有ingress, 简化版本。 
kubectl apply -f 04ingress_web.yaml 
```