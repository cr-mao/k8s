# 存储卷

## EmptyDir
删除Pod时，emptyDir数据同步消失
```shell
kubectl apply -f 01pod_emptydir.yaml
```

## hostPath

挂载到宿主机,和 docker -v 参数等效

`type: DirectoryOrCreate | Directory | File | FileOrCreate | Socket | ""`

- Directory : 没有目录会会报错

```shell
kubectl apply -f 02pod_hostPath.yaml
```


## downward

作用： 将pod的定义信息（metadata信息）挂载到容器内

```shell
kubectl apply -f 03pod_downward.yaml

kubectl exec -it busybox -n dev -- sh
printenv 
# 有 MY_NODE_NAME=k8snode1 
root@k8smaster:~# curl http://192.168.56.81:8080/podname.html
busybox
```

## configmap

```shell 
kubectl apply -f 04pod_configMap_cm.yaml
kubectl apply -f 05pod_configMap.yaml
```
进入pod，/usr/share/nginx/html下会多出个文件对应key的名称。


## secret

跟configmap 类似

进入pod，/usr/share/nginx/html下会多出个文件对应key的名称。

```shell 
kubectl apply -f 06pod_secret.yaml

```

## pv,pvc

手动创建 /nfs/share/pv01 目录

这里pvc 是通过标签 关联到了pv 运行起来后，进入pod ，touch index.html， 对应到k8snode1 ,/nfs/share/pv01 也会多出这个文件，是互通的

pvc 使用来归类的 一个pv 对应一个pvc （实践） 。 pvc这里 跟 ingress class 很像，


```shell
kubectl apply -f 07pod_pv_pvc.yaml

kubectl get pv ,pvc -n dev
```

## 动态存储卷

可以用 StorageClass 绑定一个 Provisioner 对象，而这个 Provisioner 就是一个能够自动管理存储、创建 PV 的应用，代替了原来系统管理员的手工劳动。


NFS Provisoner 安装
```shell 

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
 helm pull nfs-subdir-external-provisioner/nfs-subdir-external-provisioner
 tar zxvf nfs-subdir-external-provisioner-4.0.18.tgz
 cd nfs-subdir-external-provisioner/
 vim values.yaml
 # 修改 nfs地址及 镜像仓库（不然拉不下来）
 #image:
  #repository: dyrnq/nfs-subdir-external-provisioner
  
helm  install nfs-subdir-external-provisioner . -n kube-system --debug
helm list -n kube-system
kubectl get pod -n kube-system | grep nfs

```

pod指定pvc,pvc指定StorageClass,StorageClass通过 provisioner 自动创建管理pv。

```shell 
kubectl apply -f 08pod_sc_pvc.yaml
```
