//
//  AppDelegate.h
//  Employer
//
//  Created by Sanjit Janak Nair on 15/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class eLogin;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) eLogin *viewController;

@property (retain, nonatomic) UINavigationController *navigationController;

@end
