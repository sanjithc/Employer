//
//  eDashboard.m
//  Employer
//
//  Created by Sanjit Janak Nair on 15/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "eDashboard.h"
#import "OpenJobs.h"
#import "Nominations.h"
#import "Interviews.h"
#import "OpenJobs.h"

@interface eDashboard ()

@end

@implementation eDashboard

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem *logout = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
        
        [logout setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIColor clearColor],
                                       UITextAttributeTextColor,
                                       [UIColor blackColor],
                                       UITextAttributeTextShadowColor,
                                       [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
                                       UITextAttributeTextShadowOffset,
                                       [UIFont fontWithName:@"QuicksandBold-Regular" size:24.0],
                                       UITextAttributeFont,
                                        nil] forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = logout;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dashboard";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OpenVacancy:(id)sender {
    
    OpenJobs *vac = [[OpenJobs alloc]initWithNibName:@"OpenJobs" bundle:nil];
    [self.navigationController pushViewController:vac animated:YES];
}

- (void) logout:(UIBarButtonItem*)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged Out" message:@"Logged Out Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)Offers:(id)sender {
    Nominations *nom = [[Nominations alloc] initWithNibName:@"Nominations" bundle:nil];
    [self.navigationController pushViewController:nom animated:YES];
}

- (IBAction)Int:(id)sender {
    Interviews *ints = [[Interviews alloc] initWithNibName:@"Interviews" bundle:nil];
    [self.navigationController pushViewController:ints animated:YES];
}

- (IBAction)Noms:(id)sender {
    Nominations *ints = [[Nominations alloc] initWithNibName:@"Nominations" bundle:nil];
    [self.navigationController pushViewController:ints animated:YES];

}


@end
