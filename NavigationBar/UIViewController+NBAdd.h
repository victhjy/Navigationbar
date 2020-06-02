//
//  UIViewController+NBAdd.h
//  NavigationBar
//
//  Created by jinyang huang on 2020/6/2.
//  Copyright © 2020 hjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NBAdd)

/// Default NO, will show the navigationBar, if you want to hide navigationBar or use a customer navigationbar in your viewController, set this property to "YES" in viewDidLoad of before viewController pushed
/// 默认为 NO，显示导航栏，如果你想隐藏自己控制器的导航栏或者自定义一个导航栏，请在 viewDidLoad 或控制器被 push 前设置该属性为 YES
@property(nonatomic, assign) BOOL nb_hiddenNavbar;

/// disable current viewController's swipe back gesture, default NO
/// 取消该控制器的滑动返回功能，默认为 NO
@property(nonatomic, assign) BOOL nb_disableBackGesture;

@end

NS_ASSUME_NONNULL_END
