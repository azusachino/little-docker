# canal debug

采用 docker 启动时, 不要考虑去修改配置文件, 可以采用 environment 覆盖的模式去使用; 程序内部应该是优先读取 env, 然后才是其他数据源. PS. 配置的 env 并不会覆盖本地文件内容.
