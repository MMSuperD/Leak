//
//  LeaksTools.h
//  Leak
//
//  Created by sh-lx on 2018/12/5.
//  Copyright © 2018年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeaksTools : NSObject


/**
 get manager instance object
 @return LeaksTools
 */
+(instancetype)shareInstance;

/**
 start dectect leaks
 */
- (void)startDetectLeaks;

@end

NS_ASSUME_NONNULL_END
