//
//  JobDetail.m
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "JobDetail.h"

@interface JobDetail ()

@end

@implementation JobDetail

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
    
    [self mapData];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapData
{
    self.title = @"Vacancy Details";
    self.txtJobTitle.text = self.jobData.JobTitle;
    self.txtBranchName.text = self.jobData.Location;
    self.txtOpenings.text = @"10";
    self.txtCreatedDate.text = @"14-February-2013";
    self.txtJD.text= @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
}




@end
