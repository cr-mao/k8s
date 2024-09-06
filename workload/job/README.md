## K8S中的job

分临时job,定时任务2个类别。

### job

```text
activeDeadlineSeconds，设置 Pod 运行的超时时间。
backoffLimit，设置 Pod 的失败重试次数。
completions，Job 完成需要运行多少个 Pod，默认是 1 个。
parallelism，它与 completions 相关，表示允许并发运行的 Pod 数量，避免过多占用资源。
```



```text
export out="--dry-run=client -o yaml"

kubectl explain job

kubectl create job echo-job --image=busybox $out

kubectl apply -f job.yml

kubectl get job
kubectl get pod

#kubectl logs echo-job-pb5gh

kubectl apply -f sleep-job.yml

kubectl get job
kubectl get pod

# 观察变化
kubectl get pod -w

kubectl delete -f sleep-job.yml

kubectl create cj echo-cj --image=busybox --schedule="" $out

kubectl apply -f cronjob.yml

kubectl get cj
kubectl get pod

kubectl delete -f cronjob.yml
```