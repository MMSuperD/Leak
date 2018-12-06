//
//  UIViewController+Leak.m
//  Leak
//
//  Created by sh-lx on 2018/12/5.
//  Copyright © 2018年 sh-lx. All rights reserved.
//

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
