//
//  FileName:  ObjectLeakDetector.h
//  ProjectName:  Leak
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/1
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

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
