# Leak
内存泄漏检测

# 集成方式
## CocoaPod 集成
pod "LeakTools"

## 手动集成
拖拽目录中的 LeakTools 文件夹到项目中

# 使用方式
1.在AppDelegate.m 文件中 导入文件
```
#import <LeakTools/LeaksTools.h>
```
2.使用代码:
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[LeaksTools shareInstance] startDetectLeaks];
    return YES;
}
```

# 效果图
![leak](https://github.com/MMSuperD/Leak/blob/master/ResultPicture/leak.gif)
