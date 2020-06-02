//
//  UIViewController+NBAdd.m
//  NavigationBar
//
//  Created by jinyang huang on 2020/6/2.
//  Copyright © 2020 hjy. All rights reserved.
//

#import <objc/runtime.h>

#import "UIViewController+NBAdd.h"

@implementation UIViewController (NBAdd)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selectors[] = {
            @selector(viewWillAppear:),
            @selector(viewDidLoad)
        };
        for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); index++) {
            SEL originalSelector = selectors[index];
            SEL swizzledSelector = NSSelectorFromString([@"nb_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
            Method oriMethod = class_getInstanceMethod(self.class, originalSelector);
            Method newMethod = class_getInstanceMethod(self.class, swizzledSelector);
            BOOL isAddedMethod = class_addMethod(self.class, originalSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
            if (isAddedMethod) {
                class_replaceMethod(self.class, swizzledSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
            } else {
                method_exchangeImplementations(oriMethod, newMethod);
            }
        }
    });
}

- (void)nb_viewDidLoad {
    [self nb_viewDidLoad];
}

- (void)nb_viewWillAppear:(BOOL)animated {
    [self nb_viewWillAppear:animated];
    if (self.parentViewController &&
        [self.parentViewController isKindOfClass:[UINavigationController class]]) {
        [self.navigationController setNavigationBarHidden:self.nb_hiddenNavbar animated:animated];
    }
}

static char kAssociatedObjectKey_nb_disableBackGesture;
- (void)setNb_disableBackGesture:(BOOL)nb_disableBackGesture {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_nb_disableBackGesture, @(nb_disableBackGesture), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)nb_disableBackGesture {
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_nb_disableBackGesture)) boolValue];
}

static char kAssociatedObjectKey_nb_hiddenNavbar;
- (void)setNb_hiddenNavbar:(BOOL)nb_hiddenNavbar {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_nb_hiddenNavbar, @(nb_hiddenNavbar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)nb_hiddenNavbar {
    return [((NSNumber *)objc_getAssociatedObject(self, &kAssociatedObjectKey_nb_hiddenNavbar)) boolValue];
}

@end
