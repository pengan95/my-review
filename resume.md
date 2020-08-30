## 自我介绍
我叫黄朋安，毕业于河南大学计算机与信息工程学院，学历是本科，毕业后进入上海美锴信息技术有限公司，主要从事Extrbux.com返利站点的开发，目前主要负责提现业务的开发和维护工作，同时也会根据新的需求进行功能迭代

## 项目经验
1. Extrabux.com前台代码重构
    
    重点：mysql类实现， 使用PDO ，单例模式 抽象化通用函数， 主从数据库
    
    项目描述：
    * 老代码重构优化，升级项目的php版本为7.0, 
    * 数据库连接更新为PDO, 进行命名参数和参数绑定(prepare); 对象映射(setFetchMode())
    Mysqli (mysqli_fetch_object(res,'O')) 
    * 数据库结构优化，（大表拆分，user_address） 主从同步，读写分离
    * redis 用作商家缓存，用户信息缓存，session共享 redis主要类型 key->字符串 （list,集合，有序集合，hash字典）
    * hash用来存储用户对象信息（数组）不需要解析
    * 共享session -> nginx反向代理
    * proxy_cookie_domain 

    涉及到的问题

    * 缓存击穿（热点数据被高并发的访问，缓存失效时导致访问数据库）互斥锁 (setnx)/自己维护缓存过期，缓存穿透（查询一个不存在的数据，没有进行缓存，一直进行数据库访问）空数据进行缓存/[布隆过滤器](http://imhuchao.com/1271.html)，缓存雪崩（缓存集体过期）
    * [redis主要类型和应用](https://juejin.im/post/6844903951502934030)
        * key->字符串 （list,集合，有序集合，hash字典） 
        * string 互斥锁，用户的点击数。。。
        * hash用来存储用户信息，不需要解析（数组）
        * list可以用来做简单队列，和sort set一起使用可以构建一个有序队列 时间线（快速取一段区间）
        * set可以快速求交集 并集 差集，用户关系；去重操作
        * 有序集合 排行榜（商家推荐）
    * [redis为什么是单线程](https://draveness.me/whys-the-design-redis-single-thread/)
    * 数据库主从同步，读写分离
    具体描述：
    需求：对前台页面进行改版，舍弃了zendframe框架，和公司coupon，deal site站点通过反向代理进行合并，依靠extrabux.com的流量增加曝光率，业务上不依赖，对原有系统主要功能编写文档，并设置任务计划。对老代码中的sql语句进行优化，分离大量join操作，在代码中实现；用户信息的缓存通过redis hash存储减少解析序列化数据的操作；
    
    
2. Extrabux商家出站链接最终有效性检测工具

    项目描述 
    * node+puppeteer 实现
    * async/await, Promise机制实现
    * 任务队列，promise.all实现并行处理
    * mysql连接池管理mysql连接
    * 网络问题不能连接，重试机制，
    * 检测结果通过发送email

    项目中可能涉及的问题
    * Promise.race() Promise.all()的区别 (https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise)
    * mysql连接池的 `connection.release();` `connection.end(function(err){});` `connection.destroy();` (https://juejin.im/post/6844903746506326023)

    具体描述
    需求：一些商家的出站不能正常返回到商家主页，现有商家8000多家，运营团队无法快速的发现这些商家
    解决方案：一张商家任务表，初始化任务表，在线商家，写入或更改状态，下线商家状态置为 offline不做检测，循环遍历 商家 并行访问多个，多次重试，
    改进：使用任务队列
3. 提现系统分离和运营工具集

    重点：jwt 接口实现， 引入单元测试，thinkphp + vue.js

    项目描述：
    * 三层架构（表示层，业务逻辑层，数据访问层）[与mvc的区别](https://juejin.im/post/6844903479568252935)
    * mvc架构 thinkphp + vue.js  没有使用 mvvc 单页应用SPA
    * 并发，锁的机制（悲观锁）,事务隔离级别
    * 数据库调优经历 主从同步导致的数据不一致问题
    * CAS(Camper And Set)防止并发
    * [1]( https://www.cnblogs.com/chenqionghe/p/4845693.html) [2](https://segmentfault.com/a/1190000012773157) [3](https://tech.meituan.com/2014/08/20/innodb-lock.html)行锁统计情况`show status like 'innodb_row_lock%';` 表锁使用情况`show open tables where in_use > 0;` `SHOW INNODB STATUS` 查看死锁

    策略模式：自动支付有两种形式 -> 通过配置判断使用哪一种，实现多种策略
    模板模式：异步的自动支付 -> 固定的一个流程，paypal, 礼品卡, 等第三方服务异步方式请求支付结果。
    适配器模式：不同第三方接口在系统中实现相同的方式

    具体描述
    需求：提现系统包含两个部分，提现的Service端和提现运营工具，Service为不同系统提供提现业务的数据接口；

    解决的几个问题：排他锁实现，redis setnx实现用户多次提现问题，汇率换算问题，redis缓存，双状态确保数据准确性，钱包系统；提现变更日志；备忘录
    后台工具解决的问题权限管理 界面上使用vue实现异步加载


4. 消息通知系统

    需求：对用户的通知管理，实现邮件，站内信，手机短信和app通知统一管理，利用sqs队列，对第三方的日志信息和系统的日志进行分析，

    重点：日志分析，sqs队列，一次配置多次使用
    
    优化：可能会存在优先级不同的消息，通过redis来实现有序队列，阻塞锁的形式，如果a队列里存在消息需要处理则先处理a a>b,并设置阻塞锁其他队列不去读取

    解决的问题： 日志（mysql),服务商切换，

5. Google Sheet API的二次开发 

    重点：
    1. csv/excel 转 google sheet yeild 生成器的使用 (作为骚操作来说)
    2. 读取google sheet 标题列对象，数据列对象
    3. 使用postman工具对提现接口进行测试





## 简历之外的知识点
1. redis,memcached,mongodb区别
    1. rd 多种数据结构 string, list, set, sort set, hash,
    2. 支持持久化
    3. 
2. 非关系型数据库有哪些？ 根据种类去答
3. PHP opcode opcache
4. PHP 数组 -> hashtable 
6. vue.js, webpack, thinkphp, SPA(单页应用，Single-page application) 嵌入SPA
7. include require的区别 ，include 是包含(将文件读入并执行,有返回值,类似一个语句，执行到了) require 是要求（自身会被文件内容替换，类似一个嵌入） *_once 会判断之前是否引入过则不再引入且不执行
8. 主从同步导致的数据不一致问题解决路径
    1. 在运营同学修改商家信息时，修改完之后数据并没有更新，但操作提示是成功的；当时并没有想到是主从不同步的问题，于是去看了从库的数据的确没有更新，
9. mvc模式
    m是模型，v视图，c控制器，三者之间相关

10. 大型网站优化
    1. 针对静态资源的优化，图片，js,css base64编码或者sprit图，js,css进行合并和格式化，
    2. 动态语言静态化，smarty缓存 ob系列函数
    3. 开启opcache，减少php-fpm的开销
    4. 数据库缓存
    5. 高并发情况下就要用到负载均衡，数据库主从
    6. 


11. 提现工具和提现系统梳理

12. 为什么选择离职？你的职业规划是什么？ 

    在目前这家公司的晋升和薪酬体制不完善，在公司工作三年虽然收获了很多，结识了很多有趣的人，但对于我的职业规划来说，目前公司不能给我很好的发展，另一方面目前公司的业务体量不是很大，在高并发高流量的技术应用和实践是欠缺的，我希望我学到的东西能够得到更多的实践。
    职业规划，我希望成为一个架构师，所以为实现这个目标需要更多的项目实践。
13. 评价自己的优缺点

    我认为我的优点是
     我的执行力不错，通常领导交代的任务我都能完成，冲KPI对我不是问题。但是正因为如此，我主动地深入思考就相对少了一些，更多是在行动上。如何站到更高的格局上去看待工作，如何思考战略布局，这类深度的专研我还需要加强。
14. 你自己