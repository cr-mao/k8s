## statefulset

有状态一般配合服务发现一起使用

```text
# 管理一组Pod
# replicas 2
# 有序性 pod-0 pod-1(pod-0启动之后) -> 停止 pod-0停止(pod-1停止之后)
# 有状态 id不变 - pvc(绑定pod) -> volumeClaimTemplate
# 稳定服务发现 service->找到自己想找到的pod
# curl pod名称.svc名称.命名空间.svc.cluster.local
```


