//
//  FileName:  LeaksTools.h
//  ProjectName:  Leak
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/1
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

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
