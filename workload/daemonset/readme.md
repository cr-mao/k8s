## DaemonSet

DaemonSet 的目标是在集群的每个节点上运行且仅运行一个 Pod，就好像是为节点配上一只“看门狗”，忠实地“守护”着节点，这就是 DaemonSet 名字的由来

默认 每个node节点都会调度到，除污点（master节点默认是污点）


```shell 
kubectl describe node k8smaster  | grep Taints

# 去掉master的污点
kubectl taint node master node-role.kubernetes.io/master:NoSchedule-

```



