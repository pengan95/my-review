### 生命周期
1. 进入统一的入口文件
2. 进入start.php, 加载系统常量，配置，注册自动加载机制，注册错误和异常处理，加载惯例配置，执行应用
3. 注册


### thinkphp的常用
1. 容器和依赖注入
2. Facade 动态类方法转换为可静态调用的方法
核心代码
```php 
public static function __callStatic($method, $params)
{
	return call_user_func_array([static::createFacade(), $method], $params);
}

protected static function createFacade(string $class = '', array $args = [], bool $newInstance = false)
{
	// 如果$class为空，那么$class就等于当前的类（think\facade\Event）
	$class = $class ?: static::class;
	// 解析出该Facade类实际要代理的类
	$facadeClass = static::getFacadeClass();

	if ($facadeClass) {
		$class = $facadeClass;
	}
	// 是否要一直新建实例（否则就是单例模式）
	if (static::$alwaysNewInstance) {
		$newInstance = true;
	}
	// 使用PHP的反射类实例化该类（比如，实例化think\Event）
	return Container::getInstance()->make($class, $args, $newInstance);
}
```
3. behavior 和钩子 AOP切面编程 性能分析，日志记录..
4. 中间件  主要是做了些前置校验    [参考链接](https://segmentfault.com/a/1190000016675220)







## thinkphp laravel symfony 的区别

1. symfony通过注释来配置路由，其他两个是通过Route类指定
2. symfony twig模板引擎，laravel blade模板引擎 thinkphp thinkphp-template
3. 