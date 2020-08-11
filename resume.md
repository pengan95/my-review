## 项目经验
1. Extrabux.com前台代码重构
    重点：mysql类实现
2. Extrabux商家出站链接最终有效性检测
    
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
3. 提现系统分离

    重点：jwt 接口实现 。。。
4. 提现后台工具

    重点：thinkphp + jwt
5. 消息通知系统

    重点：日志分析，sqs队列
6. Google Sheet API的二次开发 (作为骚操作来说)

    重点：csv/excel 转 google sheet yeild 生成器的使用
    




## 简历之外的知识点
1. redis,memcached,mongodb区别
2. 非关系型数据库有哪些？ 根据种类去答
3. 