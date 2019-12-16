//
//  FileName:  NSObject+Swizzling.m
//  ProjectName:  Leak
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/1
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "NSObject+Swizzling.h"
#import <Objc/message.h>
#import <UIKit/UIKit.h>


@implementation NSObject (Swizzling)

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {
    
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    //is nil
    if (!(originalMethod && swizzledMethod)) {
        return;
    }
    
    IMP originalImp  = method_getImplementation(originalMethod);
    IMP swizzledImp  = method_getImplementation(swizzledMethod);
    
    BOOL didAddMethod = class_replaceMethod(class, originalSEL, swizzledImp, method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSEL, originalImp, method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}

- (void)setDetector:(ObjectLeakDetector *)detector {
    objc_setAssociatedObject(self, @selector(detector), detector, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ObjectLeakDetector *)detector {
    return objc_getAssociatedObject(self, @selector(detector));
}

/**
 we need give current class to add the detector and start detect
 */
- (void)markObject {
    
    // if detector is nil,we need return;
    if (self.detector) {
        return;
    }
    
    //skip system class
    NSString *className = NSStringFromClass([self class]);
    if ([className hasPrefix:@"_"] || [className hasPrefix:@"NS"] || [className hasPrefix:@"UI"]) {
        return;
    }
    
    //view object needs a superView to be alive
    if ([self isKindOfClass:[UIView class]]) {
        UIView *currentView = (UIView *)self;
        if (currentView.superview == nil) {
            return;
        }
    }
    
    //controller object needs a parent to be alive
    if ([self isKindOfClass:[UIViewController class]]) {
        UIViewController *currentVc = (UIViewController *)self;
        if (currentVc.navigationController == nil && currentVc.presentingViewController == nil) {
            return;
        }
    }
    
    ObjectLeakDetector *dec = [[ObjectLeakDetector alloc] init];
    self.detector = dec;
    [dec sendLeakDetectedNotification:self];
    
}

@end
