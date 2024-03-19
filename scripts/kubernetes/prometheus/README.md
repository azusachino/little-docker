# K8S deploy Prometheus

- rbac
- storage
- config
- deployment

## deployment containers

- prometheus: Prometheus 容器是主容器，用于运行 Prometheus 进程。
- configmap-reload: 用于监听指定的 ConfigMap 文件中的内容，如果内容发生更改，则执行 webhook url 请求。因为 Prometheus 支持通过接口重新加载配置文件，所以这里使用这个容器提供的机制来完成
  Prometheus ConfigMap 配置文件内容一有更改，就执行 Prometheus 的 /-/reload 接口，进行更新配置操作。

## deployment parameter

- --web.enable-lifecycle: 启用 Prometheus 用于重新加载配置的 /-/reload 接口。
- --config.file: 指定 Prometheus 配置文件所在地址，这个地址是相对于容器内部而言的。
- --storage.tsdb.path: 指定 Prometheus 数据存储目录地址，这个地址是相对于容器而言的。
- --storage.tsdb.retention.time: 指定删除旧数据的时间。默认为 15d。
- --web.console.libraries: 指定控制台组件依赖的存储路径。
- --web.console.templates: 指定控制台模板的存储路径。

## grafana

- 可视化: 提供多种可选择的不同类型的图形，能够灵活绘制不同样式，且还提供很多插件，可以很方便的对数据指标和日志进行可视化操作。
- 动态仪表盘: 提供以模板和变量的方式来创建动态且可重复使用的仪表盘，这些模板变量显示在仪表盘顶部，可以灵活调整。
- 浏览指标: 通过瞬时查询和动态变化等方式展示数据，可以根据不同的时间范围拆分视图。
- 浏览日志: 体验使用保留的标签过滤器从指标切换到日志的魔力，可以快速搜索所有日志或实时流式传输的数据。
- 警报: 可以直观地根据重要的指标定义警报规则。Grafana 将不断评估并向 Slack，PagerDuty，VictorOps，OpsGenie 等系统发送通知。
- 混合数据源: 在同一图中混合不同的数据源，可以基于每个查询指定不同数据源。

## grafana plugins

```shell
kubectl get pods -A | grep -e "grafana"
kubectl exec -it grafana-7cc5f9cc5c-65rlm \
  -c grafana \
  -n kube-system \
  -- grafana-cli plugins install grafana-piechart-panel
# 在 Kubernetes 中，可以通过 kubectl 的 scale 命令控制 Deployment 资源缩成 0 个副本
# 然后再扩展成 1 个副本，这样 Pod 会被先删除，再进行重启
kubectl scale deployment grafana --replicas=0 -n kube-system
kubectl scale deployment grafana --replicas=1 -n kube-system
```