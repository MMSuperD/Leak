//
//  FileName:  NSObject+Swizzling.h
//  ProjectName:  Leak
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/1
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”


#import <Foundation/Foundation.h>
#import "ObjectLeakDetector.h"
@protocol ObjectDelegate <NSObject>

@optional
- (BOOL)isOnScreen;

@end

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)<ObjectDelegate>

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

- (void)markObject;

@property (nonatomic,strong)ObjectLeakDetector *detector;

@end

NS_ASSUME_NONNULL_END
