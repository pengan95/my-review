# MySQL知识点集合

## MySQL性能优化之Explain语句

## PHP PDO长连接(https://stackoverflow.com/questions/3332074/what-are-the-disadvantages-of-using-persistent-connection-in-pdo)

## 非关系型数据库 mongodb, redis , hbase (https://www.zhihu.com/question/30219620)
mongodb可以当作简单场景下的但是性能高数倍的MySQL, Redis基本只会用来做缓存，HBase用来做离线计算
    
1. [Redis和Memcache的区别](https://www.cnblogs.com/aspirant/p/8883871.html)
    * redis 支持多种数据结构 string list set  sorted set 发布订阅 stream
    * 基于内存
    * redis支持持久化

2. redis 持久化，


3. mysql事务隔离级别和MVCC
    脏写      -> Innodb数据库不允许这种情况发生，在修改数据的语句中会对数据进行加排他锁
    脏读      -> 并行事务a,b a事务读到了b未提交的数据
    不可重复读 -> 并行事务a,b b事务提交后，a事务读取到b提交前后*修改和删除*的数据 update delete
    幻读      -> 并行事务a,b b事务提交后，a事务读取到b提交前后*增加*的数据 insert 

    事务隔离级别
    读未提交 mvcc实现 读最新版本的数据
    读已提交 mvcc实现 每条查询语句都生成当前时刻的read view 
    可重复读 mvcc实现 第一条查询语句生成的 read view 不再更改
    串行化  加锁实现

    mvcc 事务号 min_事务 max_事务 （查询时不生成事务号，只在修改操作上生成）
4. Mysql查询优化
    * 正确创建索引和使用索引，创建索引的字段的数据区分度要高，尽量避免回表查询，能够用到索引覆盖就最好
    * where条件中不要使用!= 或者模糊查询前缀百分号，这些会造成索引失效
    * join操作代替子查询，子查询会创建临时表
    * 避免使用select *  很大的可能造成索引回表
