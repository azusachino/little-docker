-- 在数据库集群中创建空密码、无权限用户haproxy，来供Haproxy对MySQL数据库进行心跳检测
create user 'haproxy'@'%' identified by '';