//
//  Interviews.m
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "Interviews.h"

@interface Interviews ()

@end

@implementation Interviews

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
    // Do any additional setup after loading the view from its nib.
    self.title = @"Interviews";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTblInterviews:nil];
    [super viewDidUnload];
}


@end
