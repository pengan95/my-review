# API问题面试应答模板
1. API设计
    1. jwt token的结构
        1. header {'alg','typ':'jwt'} 头部
        2. payload {'iss','aud','exp'}
        3. `sign(base64UrlEncode(header) + "." +base64UrlEncode(payload),key,alg)`
    2. jwt流程设计
        * 初次登录，需要用户名和密码
        * 密码校验(数据库)
        * 根据数据库返回信息，配置规则生成jwt 返回给客户端
        * 客户端记录token 请求中添加token
        * 客户端可以实现过期重连
        * 
    3. jwt可能会问到的问题
        * 加密方式有哪几种
        * 安全性问题，1.在payload里不要给重要信息 2.签名算法不能为none 3. 如果是非对称加密不要在客户端使用公钥加密；一般情况下只要密钥不泄露
        
    [jwt标准格式示例](https://jwt.io/)

    4. Oauth2.0

2. API代码实现数据库

2. API问题
    1. 多个请求，请求幂等性问题，如果
    2. 大量请求下的措施 

    参考链接
    [REST API 面临的 7 大安全威胁](https://www.infoq.cn/article/caQ6KibpAquIgFoku0up)