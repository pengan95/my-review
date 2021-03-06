# 基础知识中不明确的地方
1. mysql innodb和myism的区别
    1. 索引类型
    2. 

2. 全文索引引擎 es

3. MYSQL关联查询和更新

4. MySQL查询优化
    
    分析查询慢的原因
    1. 记录慢查询日志，分析查询日志。 pt-query-digest工具
    2. 使用`set profiling = 1` `show profiles` `show profile for query 2`
    3. `show status`
    4. `show processlist`
    5. explain 语句分析单条语句

    避免使用如下SQL
    1. 查询不需要的记录
    2. 多表关联返回全部列
    3. 缓存重复数据
    4. 是否在扫描大量数据，使用索引覆
    5. 改变数据库表结构，修改数据表范式

    优化长难的查询语句
    1.切分查询 
    2.分解关联查询
    
    优化特定类型查询语句
    1. 优化count()查询： explain 近似值；使用汇总表；使用缓存
    2. 优化关联查询：确定ON Using 子句的列上有索引 ；确保group by和order by 只有一个表的列
    3. 优化子查询 用关联替代
    4. 优化group by 和 distinct
    5. limit 分页，可以记录上次记录最大id
    6. 使用union 查询（会自动去重），使用union all替代

5. Mysql高级应用
    
    Mysql分区分表
    1. 分区表原理 物理层面的拆分，对客户端无感知
    2. 分区表工作原理 partition by 定义每个分区的内容
    3. 使用场景 表非常大，热点数据分布特征明显；分区表更容易维护，针对独立分区操作；分区表可以分布在不同的机器上；
    4. 缺点：一个表最多只能有1024个分区；分区表表达式必须是整数（5.1）；可以使用列分区（>5.5）；无法使用外键；所有分区必须使用相同的存储引擎；
    
    Mysql分库分表
    1. 工作原理：通过hash算法或工具实现数据表的垂直或水平切分
    2. 场景：单表数据达到千万和百万
    3. 方式：水平对业务影响大

    扩展性较差

    Mysql复制原理及负载均衡

6. 算法

    排序算法
    1. ✅冒泡排序
    2. ✅直接插入排序
    3. ❌希尔排序
    4. ❌快速排序 递归
    5. 堆排序 二叉树
    6. 归并排序
    
    查找算法
    1. 二分查找
    2. 顺序查找

7. 高并发和大流量解决方案

    高并发的相关概念
        1. QPS 每秒响应请求数
        3. 并发请求数
        2. 吞吐量 单位时间处理的请求数
        3. 响应时间 从请求发出到收到响应花费的时间
        4. PV ，页面浏览量和点击量
        5. 带宽 峰值流量和平均页面大小
        6. 日网站带宽 
    高并发的案例

    流量优化
        
        1. 防盗链处理
        
        2. 前端优化
            1. 减少http请求 css 图片请求
            2. 添加异步请求
            3. 启用浏览器缓存和文件压缩
            4. CDN加速
            5. 建立独立的图片服务器
        3. 服务端优化
            1. 页面静态化
            2. 并发处理
            3. 队列处理
        4. 数据库优化
            1. 数据库缓存
            2. 分库分表，分区操作
            3. 读写分离
            4. 负载均衡
        5. Web服务器优化
            1. 负载均衡

        防盗链工作原理
            1. 通过referer/签名来判断请求是否合法 合法显示不合法错误提示
            2. nginx valid_referer
            3. HttpAccessKeyModule md5(客户端ip+key)
    
    减少http请求
        
        1.图片地图的方式
        2.CSS Sprites backgroud-image backgroud-position
        3.合并脚本和样式表
        4.图片使用base64编码
    
    浏览器缓存和数据压缩
        
        1. Http缓存机制 , 启用浏览器缓存 200 from cache/304 Not Modified
            Cache-Control: no-store/no-cache（协商缓存304）/max-age=xx

            协商缓存 Last-Modified 通知最后修改时间 If-Modified-Sinece
        2. 适合缓存的内容
        3. 适合协商缓存的内容
            * HTML文件
            * JS，CSS
    
    Nginx配置缓存策略
        
        1. add_header指令
        2. expires 12h/30d/max(默认10年)
        3. etag on/off

    前端代码和资源压缩
        
        1. nginx gzip相关模块配置
    
    CDN加速

        1. CDN 内容分发网络 分布节点服务器，最近的服务器返回内容
        2. 工作原理
            跟DNS缓存原理类似
        3. 场景 静态资源 图片，css，js，大文件，直播网站
        4. ❌LVS四层负载均衡
    
    ❌独立图片服务器的部署
    
        1. 必要性
            * 分担Web服务器的的I/O负载
            * 专门针对图片服务器进行优化
        2. 采用独立域名
            * 突破浏览器同一个域名连接数的限制
            * 带有cookie的请求导致图片不能命中cache
        3. 图片同步 
            * NFS共享 FTP同步
    
    动态语言静态化

        1. 原因： 解决CPU负载过高和数据库

        2. 实现方式
            1. 模板引擎 smarty
            2. ob系列函数

    动态语言的并发处理
        
        1. 进程的状态集 创建 就绪 执行 阻塞 终止
        2. 线程的状态集 
        3. 协程 由用户控制

        进程和线程的区别
            1. 线程是进程内的一个执行单元，进程内至少有一个线程，它们共享进程的地址空间，而进程有自己独立的地址空间
            2. 进程是资源分配和拥有的单位，同一个进程的线程是共享进程资源的
            3. 线程是处理器调度的基本单位，进程不是
            4. 二者均可并发执行 多核cpu才会有并行
            5. 每个独立的线程有一个程序运行的入口，顺序执行序列和程序出口，但是线程不能独立执行，必须依存在应用程序中，由应用程序提供多个线程执行控制


        线程和协程的区别
            1. 一个线程可以有多个协程，一个进程也可以单独拥有多个协程
            2. 线程进程都是同步机制，而协程是异步
            3. 协程能保留上一次调用时的状态，每次过程重入时就相当于上一次调用的状态
        
        多进程和多线程

        同步阻塞

        异步非阻塞

        swool异步模型 reactor事件模型 curl_multi_xxx()线程并发

5. 数据库缓存
    
    缓存需要考虑的内容
    1. 缓存方式的选择
    2. 缓存场景的选择
    3. 缓存数据的实时性
    4. 缓存数据的稳定性

    Mysql查询缓存
    1. query_cache_type = 0(off)/1(常开)/2(按需) 
    2. query_cache_type = 1 也可以关闭查询缓存 SELECT **SQL_NO_CACHE** * FROM ...
    3. query_cache_size = int 为0则无法使用
    4. 清理查询缓存 FLUSH QUERY CACHE; RESET QUERY CACHE; FLUSH TABLE;

    Memcache缓存查询数据

    Redis缓存查询数据

    ### Redis,Memcache区别
    
    redis 支持(快照，AOF)持久化，依赖快照进行持久化，aof增强了可靠性，影响性能；数据类型多；依赖客户端实现分布式读写；数据量小的高性能操作
    memcache 本身没有数据冗余机制；不支持持久化；并发场景用cas保证一致性，redis事务支持比较弱，只能保证事务中的每个操作连续执行；

6. 缓存其他数据
    
    session session_set_save_handler

7. MySQL数据库层的优化

    1. 数据表数据类型优化
    2. 索引优化
    3. SQL语句的优化
    4. 存储引擎的优化
    5. 数据表结构设计优化
    6. 数据库服务器架构优化

    #### 类型
    1. tinyint smallint bigint unsign(非负)
    2. char(固定的) varchar(会额外存储字符长度)
    3. enum 排序按索引
    4. ip地址 ip2long()

    #### 索引
    1. 合适字段创建合适索引 影响写性能增加空间消耗
    2. like查询
    3. 全表扫描优化
    4. or条件索引使用情况
    5. 字符串类型索引失效

    #### SQL语句优化
    1. 使用LIMIT
    2. 

    #### 存储引擎的优化
    1. 

    #### 数据表结构设计优化
    1. 分区分表
    2. 分库分表

    #### 数据库服务器架构优化
    1. 主从复制
    2. 读写分离
    3. 双主热备
    4. 负载均衡 LVS MyCat

4. Web服务器的负载均衡

    ### 七层负载均衡实现
    1. 基于URL等应用层信息的负载均衡

        Nginx的proxy实现七层负载均衡

        内置策略 IP Hash 加权轮询

        扩展策略 fair策略 通用hash 一致性hash

        **加权轮询** 
    
    ### 四层负载均衡
5. 