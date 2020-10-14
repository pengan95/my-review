## top命令
```
top - 06:47:42 up 14 days,  6:36,  1 user,  load average: 0.00, 0.00, 0.00 
Tasks:  94 total,   1 running,  54 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.7 us,  0.3 sy,  0.0 ni, 99.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  1877076 total,   348192 free,   159320 used,  1369564 buff/cache
KiB Swap:        0 total,        0 free,        0 used.  1526736 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND                                                                                                          
27657 root      20   0  937072  22720  15544 S  0.3  1.2   1:14.54 YDService                                                                                                        
    1 root      20   0  159952   9512   6992 S  0.0  0.5   0:19.68 systemd                                                                                                          
    2 root      20   0       0      0      0 S  0.0  0.0   0:00.15 kthreadd                                                                                                         
    4 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 kworker/0:0H                                                                                                     
    6 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 mm_percpu_wq                                                                                                     
    7 root      20   0       0      0      0 S  0.0  0.0   0:29.76 ksoftirqd/0                                                                                                      
    8 root      20   0       0      0      0 I  0.0  0.0   0:56.39 rcu_sched                                                                                                        
    9 root      20   0       0      0      0 I  0.0  0.0   0:00.00 rcu_bh                                                                                                           
   10 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 migration/0
```
1. 第一行
当前时间 系统运行时间 当前登录用户数 系统负载（即任务队列的平均长度。三个数值分别为 1分钟、5分钟、15分钟前到现在的平均值。）
2. 第二行
进程信息 H 可以切换成线程信息
3. 第三行
cpu信息 多核的话会有多行  

    ```
    0.3% us 用户空间占用CPU百分比  
    1.0% sy 内核空间占用CPU百分比  
    0.0% ni 用户进程空间内改变过优先级的进程占用CPU百分比  
    98.7% id 空闲CPU百分比  
    0.0% wa 等待输入输出的CPU时间百分比  
    0.0% hi：硬件CPU中断占用百分比  
    0.0% si：软中断占用百分比  
    0.0% st：虚拟机占用百分比  
    ```
4. grep
   
   参数：-v 排除 -c 统计行数 -n 显示行数

