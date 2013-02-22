//
//  RedirectToWebpage.m
//  Employer
//
//  Created by Sanjit Janak Nair on 22/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "RedirectToWebpage.h"

@interface RedirectToWebpage ()

@end

@implementation RedirectToWebpage

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
    
    _btnSelect = [[UIBarButtonItem alloc]initWithTitle:@"Select" style:UIBarButtonItemStyleBordered target:self action:@selector(SelectClick)];
    _btnReject = [[UIBarButtonItem alloc]initWithTitle:@"Reject" style:UIBarButtonItemStyleBordered target:self action:@selector(RejectClick)];
    
    
    NSArray *arr = [[NSArray alloc]initWithObjects:_btnReject,_btnSelect,nil];
    
    self.navigationItem.rightBarButtonItems = arr;
    
    // Do any additional setup after loading the view from its nib.
    NSURL *add = [[NSURL alloc]initWithString:self.IPURL];
    NSURLRequest *url = [[NSURLRequest alloc] initWithURL:add];
    [self.WebView loadRequest:url];
}

- (void) SelectClick
{
    NSLog(@"Select");
    UIAlertView *sel = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you sure you wish to Select this Candidate?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [sel show];
    _btnSelect.enabled = NO;
    _btnReject.enabled = NO;
}

- (void) RejectClick
{
    NSLog(@"Reject");
    UIAlertView *sel = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you sure you wish to Reject this Candidate?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [sel show];
    _btnSelect.enabled = NO;
    _btnReject.enabled = NO;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}

- (void)RedirectTo:(NSString*) iurl {
    self.IPURL = iurl;
}

@end
