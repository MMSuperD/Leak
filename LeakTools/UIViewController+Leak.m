//
//  FileName:  UIViewController+Leak.m
//  ProjectName:  Leak
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/1
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”


#import "UIViewController+Leak.h"
#import "NSObject+Swizzling.h"
@implementation UIViewController (Leak)

+ (void)load{
    [self swizzleSEL:@selector(wd_presentViewController:animated:completion:) withSEL:@selector(presentViewController:animated:completion:)];
}

- (void)wd_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    [self wd_presentViewController:viewControllerToPresent animated:flag completion:completion];
    
#if DEBUG
    [viewControllerToPresent markObject];
#endif
    
}

- (BOOL)isOnScreen {
    BOOL alive = false;
    alive = self.isViewLoaded && self.view.window;
    return alive;
}

@end
