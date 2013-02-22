//
//  eLogin.h
//  Employer
//
//  Created by Sanjit Janak Nair on 15/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface eLogin : UIViewController <UITextFieldDelegate> { MBProgressHUD *hud;}
- (IBAction)BtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *UserID;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@end
