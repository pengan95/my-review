Jetbrains系列产品重置试用方法
如何安装
1. 插件市场安装：
   * 在Settings/Preferences... -> Plugins 内手动添加第三方插件仓库地址：https://plugins.zhile.io  
   * 搜索：IDE Eval Reset插件进行安装。如果搜索不到请注意是否做好了上一步？网络是否通畅？  
   * 插件会提示安装成功。
2. 下载安装：
   * 点击这个链接([v2.1.6](https://plugins.zhile.io/files/ide-eval-resetter-2.1.6.zip))下载插件的zip包（macOS可能会自动解压，然后把zip包丢进回收站）
   * 通常可以直接把zip包拖进IDE的窗口来进行插件的安装。如果无法拖动安装，你可以在Settings/Preferences... -> Plugins 里手动安装插件（Install Plugin From Disk...）
   * 插件会提示安装成功。
3. 如何使用
    * 一般来说，在IDE窗口切出去或切回来时（窗口失去/得到焦点）会触发事件，检测是否长时间（25天）没有重置，给通知让你选择。（初次安装因为无法获取上次重置时间，会直接给予提示）
    * 也可以手动唤出插件的主界面：
      1. 如果IDE没有打开项目，在Welcome界面点击菜单：Get Help -> Eval Reset
      2. 如果IDE打开了项目，点击菜单：Help -> Eval Reset
    * 唤出的插件主界面中包含了一些显示信息，2个按钮，1个勾选项：
      1. 按钮：Reload 用来刷新界面上的显示信息。
      2. 按钮：Reset 点击会询问是否重置试用信息并重启IDE。选择Yes则执行重置操作并重启IDE生效，选择No则什么也不做。（此为手动重置方式）
      3. 勾选项：Auto reset before per restart 如果勾选了，则自勾选后每次重启/退出IDE时会自动重置试用信息，你无需做额外的事情。（此为自动重置方式）

4. 更新重启
