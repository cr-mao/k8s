## pod 


```shell
kubectl get pod -n kube-system 
# 查看所有命名空间下的 pod 
kubectl get pod -A
# 更详细， 在哪个节点，节点 ip 信息等
kubectl get pod -A -o wide


# 创建一个 nginx pod 。端口80 ，命名空间 dev 
kubectl run nginx --image=nginx:latest --port=80 -n dev 


kubectl delete pod nginx -n dev 
kubectl delete namespace dev 


kubectl apply -f 1.pod_nginx.yaml
kubectl describe pod nginx -n dev 
kubectl delete -f 1.pod_nginx.yaml 

# 进入pod 中的容器
kubectl exec `pod_name`  -n dev -it -c `container_name` /bin/bash 

```


pod 钩子函数 主要有 2 个 postStart 和preStop 。postStart 在容器创建之后执行，preStop则在容器销毁之前执行。 

```shell
kubectl explain pod.spec.containers.lifecycle
kubectl explain pod.spec.containers.lifecycle.postStart
kubectl explain pod.spec.containers.lifecycle.preStop
```



- [init容器](https://www.crblog.cc/cloud-native/sre-k8s-hig.html#init%E5%AE%B9%E5%99%A8%E7%9A%84%E5%9F%BA%E6%9C%AC%E4%BD%BF%E7%94%A8sidecar%E6%A8%A1%E5%BC%8F)
- [3个探针](https://www.crblog.cc/cloud-native/sre-k8s-hig.html#pod%E5%81%A5%E5%BA%B7%E6%A3%80%E6%9F%A5)

