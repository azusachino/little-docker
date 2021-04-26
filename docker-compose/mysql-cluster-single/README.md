# PXC

**查看集群状态**  
show status like 'wsrep%';

3306 数据库对外提供服务的端口
4444 镜像数据传输 SST，集群数据同步端口，全量同步，新节点加入时起作用
4567 集群节点间相互通信的端口
4568 增量数据同步 IST，节点下线、重启后使用该端口，增量同步数据。

## 开放 3306, 4444, 4567 和 4568 四个端口

firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --zone=public --add-port=4444/tcp --permanent
firewall-cmd --zone=public --add-port=4567/tcp --permanent
firewall-cmd --zone=public --add-port=4568/tcp --permanent
firewall-cmd --reload
firewall-cmd --list-ports

## 集群参数描述

```plain

wsrep_cluster_name 
   指定您的群集的逻辑名称。对于群集中的所有节点，它必须相同。

wsrep_cluster_address 
   指定群集中节点的IP地址。节点加入集群至少需要一个，但建议列出所有节点的地址。这样，如果列表中的第一个节点不可用，则加入节点可以使用其他地址。 
   注意：群集中的初始节点不需要地址。但是，建议指定它们并正确引导第一个节点。这将确保节点将来能够重新加入集群。

wsrep_node_name 
   指定每个单独节点的逻辑名称。如果未指定此变量，则将使用主机名称。

wsrep_node_address 
   指定该特定节点的IP地址。

wsrep_sst_method 
   默认情况下，Percona XtraDB集群使用Percona XtraBackup进行状态快照传输（SST）。 强烈建议设置wsrep_sst_method=xtrabackup-v2。 
   这种方法需要用户在初始节点上建立SST。用wsrep_sst_auth变量提供SST用户凭据。

wsrep_sst_auth 
   指定认证凭证SST 作为:。您必须在引导第一个节点时创建此用户 并为其提供必要的权限：
1 mysql> CREATE USER 'hanson'@'localhost' IDENTIFIED BY 'passw0rd';
2 mysql> GRANT RELOAD, LOCK TABLES, PROCESS, REPLICATION CLIENT ON *.* TO 'hanson'@'localhost';
3 mysql> FLUSH PRIVILEGES;  

pxc_strict_mode 
   PXC严格模式在默认情况下ENFORCING处于启用状态，并设置为阻止在Percona XtraDB集群中使用实验和不支持的功能。 
   为确保数据强一致性，建议至少启用PERMISSIVE模式 
      关于这个参数的具体描述可以参考：Percona XtraDB Cluster Strict Mode(PXC 5.7 )

binlog_format 
   Galera只支持行级复制，所以设置binlog_format=ROW。

default_storage_engine 
   Galera完全支持InnoDB存储引擎。它不能与MyISAM或任何其他非事务性存储引擎正常工作。将此变量设置为default_storage_engine=InnoDB。

innodb_autoinc_lock_mode 
   Galera仅支持InnoDB的交错（2）锁定模式。设置传统（0）或连续（1）锁定模式会导致复制失败，因为未解决的死锁。将此变量设置为innodb_autoinc_lock_mode=2

```
