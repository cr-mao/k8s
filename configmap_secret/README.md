## configmap 、secret


### configmap

```shell
export out="--dry-run=client -o yaml"
kubectl create cm info --from-literal=k=v $out

kubectl apply -f 01config_map.yaml
# 获得configmap 
kubectl get cm
# 查看详细信息
kubectl describe cm info
```

### secret


```shell
kubectl create secret generic user --from-literal=name=root  --dry-run=client -o yaml

# 创建secret 
kubectl apply -f 02secret.yaml
# 查看信息
# 使用 kubectl describe 不能直接看到内容，只能看到数据的大小
kubectl describe secret user
```

### 如何以环境变量的方式使用 ConfigMap/Secre
```shell
kubectl apply -f 04pod-env-from-configmap-and-secret.yaml
```


### 如何以 Volume 的方式使用 ConfigMap/Secret
```shell
kubectl apply -f 05pod-env-from-volumn-cm-secret.yaml
```



