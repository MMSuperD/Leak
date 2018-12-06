//
//  NSObject+Swizzling.h
//  Leak
//
//  Created by sh-lx on 2018/12/5.
//  Copyright © 2018年 sh-lx. All rights reserved.
//

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
