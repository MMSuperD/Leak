//
//  ObjectLeakDetector.m
//  Leak
//
//  Created by sh-lx on 2018/12/5.
//  Copyright © 2018年 sh-lx. All rights reserved.
//

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
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ping" object:nil];
}

@end
