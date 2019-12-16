//
//  FileName:  LeaksTools.m
//  ProjectName:  Leak
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/1
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "LeaksTools.h"
#import <UIKit/UIKit.h>

@implementation LeaksTools{
    
    NSTimer *_timer;
}

+ (instancetype)shareInstance {
    static LeaksTools *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        #if DEBUG
            [self initFunction];
        #endif
    }
    return self;
}

- (void)initFunction {
    [self initNotification];
    [self initTimer];
}

/**
 init Timer
 */
- (void)initTimer {
    
    _timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(sendPing) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

/**
 init Notification
 observer pong Notifcation
 */
- (void)initNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerPongNotifcation:) name:@"pongNotification" object:nil];
}

/**
 detect pongNotifcation

 @param object object
 */
- (void)observerPongNotifcation:(NSNotification *)object {
    
    NSObject *obj = object.object;
    
    NSString *message = NSStringFromClass([obj class]);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oops! A leak here" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:action1];
    
    UIViewController *currentRootController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    [currentRootController presentViewController:alertController animated:YES completion:nil];

}


/**
 send ping Notification
 */
- (void)sendPing {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pingNotification" object:nil];
}

- (void)startDetectLeaks {
    
    
}

@end
