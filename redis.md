# Redis知识点集合

### 大纲
1. redis数据类型
2. redis类型常见应用场景
3. redis集群知识

[predis和phpredis的区别](https://segmentfault.com/q/1010000008848852)
[api并发调优过程](https://juejin.im/post/6844903849132556296)
[keys / scan 命令用来获取指定前缀的key](http://jinguoxing.github.io/redis/2018/09/04/redis-scan/)

### 类型
1. string (set -> nx ex px) 并发锁 
2. list 可以做消息队列 一致性要求不高
3. set 集合 可以做一些交集并集的运算
4. sort set 有序集合 
5. hash 用来存储对象数据 减少程序的解析操作
6. *pub/sub 订阅*
7. *hyperloglog*
8. *bitmap*
9. *stream*

## redis是单线程的？ 为什么处理快？
    redis单线程是指处理网络请求是单线程的，其他持久化的处理是调用新的线程/进程处理
    