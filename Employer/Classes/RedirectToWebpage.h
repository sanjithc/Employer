//
//  RedirectToWebpage.h
//  Employer
//
//  Created by Sanjit Janak Nair on 22/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedirectToWebpage : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *WebView;
@property NSString *IPURL;
@property UIBarButtonItem *btnSelect;
@property UIBarButtonItem *btnReject;
@end
