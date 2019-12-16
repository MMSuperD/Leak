//
//  FileName:  ObjectLeakDetector.m
//  ProjectName:  Leak
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/1
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "ObjectLeakDetector.h"
#import "NSObject+Swizzling.h"
@interface ObjectLeakDetector()

@property (assign,nonatomic)NSInteger pingCount;

@end

@implementation ObjectLeakDetector

- (void)sendLeakDetectedNotification:(NSObject *)detector {
    self.weakTarget = detector;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pingNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ping:) name:@"pingNotification" object:nil];
}

- (void)ping:(NSNotification *)object {
    
    // in order to execute one time
    if (self.pingCount > 3) {
        return;
    }
    
    if (!self.weakTarget) {
        return;
    }
    
    if (![self.weakTarget isOnScreen]) {
        
        self.pingCount++;
        
        NSLog(@"%zd",self.pingCount);
    }
    
    if (self.pingCount > 3) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pongNotification" object:self.weakTarget];
    }
    
    
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pingNotification" object:nil];
}

@end
