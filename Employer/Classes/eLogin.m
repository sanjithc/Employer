//
//  eLogin.m
//  Employer
//
//  Created by Sanjit Janak Nair on 15/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "eLogin.h"
#import "eDashboard.h"
#import "eDashboardNew.h"
#import "Data Access/Authenticate.h"
#import "Data Access/AuthenticateJSON.h"
#import "Libraries/MBProgressHUD/MBProgressHUD.h"

@interface eLogin ()

@end

@implementation eLogin

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.labelText = @"Authenticating";
    hud.detailsLabelText = @"";
    hud.color = [UIColor colorWithRed:188/255.0 green:214/255.0 blue:82/255.0 alpha:0];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:hud];
    
    self.UserID.delegate = self;
    
    
    self.Password.delegate = self;
    self.title = @"Welcome";
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    _UserID.text = @"";
    _Password.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnClick:(id)sender
{
    if([_Password isFirstResponder])
       [_Password resignFirstResponder];
    
    if(([_UserID.text length] == 0) || ([_UserID.text length] == 0))
    {
        UIAlertView *noUID = [[UIAlertView alloc] initWithTitle:@"Mandatory Fields" message:@"Please enter the UserID And Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [noUID show];
        return;
    }
    
    [hud showWhileExecuting:@selector(AuthenticateUser) onTarget:self withObject:nil animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if ([textField isEqual:self.UserID])
    {
        [self.Password becomeFirstResponder];
    }
    else
    {
      [hud showWhileExecuting:@selector(AuthenticateUser) onTarget:self withObject:nil animated:YES];  
    }
    return YES;
}

- (void)AuthenticateUser
{
    dispatch_queue_t downloadQueue = dispatch_queue_create("AuthenticateUser", NULL);
    dispatch_async(downloadQueue, ^{
        // do any UI stuff on the main UI thread
        dispatch_async(dispatch_get_main_queue(), ^{
            Authenticate *objA = [[Authenticate alloc] init];
            NSString *op = nil;
            @try
            {
                op = [objA AuthenticateMe:self.UserID.text:self.Password.text];
                [hud hide:YES];
                NSLog(@"Response %@",op);
                if (!op)
                {
                    UIAlertView *invalidLogin = [[UIAlertView alloc] initWithTitle:@"Unable To Login" message:@"Invalid UserName/Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [invalidLogin show];
                }
                else
                {
                    NSLog(@"RID %@",op);
                    eDashboardNew *nextForm = [[eDashboardNew alloc] init];
                    [self.navigationController pushViewController:nextForm animated:YES];
                }
            }
            @catch (NSException *e) {
                UIAlertView *invalidLogin = [[UIAlertView alloc] initWithTitle:@"Unable To Login" message:@"Invalid UserName/Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [invalidLogin show];
            }
        });
        
    });
    dispatch_release(downloadQueue);
}


@end
