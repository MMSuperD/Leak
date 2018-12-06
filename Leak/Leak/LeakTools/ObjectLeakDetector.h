//
//  ObjectLeakDetector.h
//  Leak
//
//  Created by sh-lx on 2018/12/5.
//  Copyright © 2018年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectLeakDetector : NSObject

@property (weak,nonatomic)NSObject *weakTarget;


/**
 send detected Notification

 @param detect Object
 */
- (void)sendLeakDetectedNotification:(NSObject *)detector;

@end

NS_ASSUME_NONNULL_END
