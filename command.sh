#!/bin/bash


# 快速体验命令
kubectl get nodes
# 创建一个 deployment
kubectl create deployment nginx --image=nginx:1.14-alpine
# 暴露端口 ,会自动创建service
kubectl expose deployment nginx --port=80 --type=NodePort
kubectl get service
kubectl get namespace
kubectl get ns
# 查看命名空间状态
kubectl get ns kube-system
kubectl create namepsace dev
kubectl get namepsace dev

kubectl delete namepsace dev

# 强制删除Terminating pod
kubectl delete pod  xxxxx --force



# 如何看apiVersion
kubectl api-resources --namepsace=true
kubectl api-resources --namepsace=false

# 如何编写yaml,看有哪些属性 及 属性的类型
kubectl  explain pod
kubectl explain pod.metadata
kubectl explain pod.spec
 kubectl explain pod.spec.containers.imagePullPolicy

