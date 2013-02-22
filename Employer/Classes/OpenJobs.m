//
//  OpenJobs.m
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "OpenJobs.h"
#import "HireCraft Objects/JobDataObject.h"
#import "Grid Templates/OpenJobCell.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "JobDetail.h"

@interface OpenJobs ()

@end

@implementation OpenJobs

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.hidesBackButton = YES;
        self.JobDataFromWS = [[NSMutableArray alloc] init];       
        [self StartWebService];
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Open Vacancies";
    self.navigationItem.hidesBackButton = NO;
    
}

- (void) StartWebService
{
    NSString *URL = WEB_SERVICE_URL;
    URL = [URL stringByAppendingString:@"/GetJobs"];
    
    NSURL *wsURL = [NSURL URLWithString:URL];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:wsURL];
    
    [request setDelegate:self];
    [request startAsynchronous];
    
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    if (request.responseStatusCode == 400) {
        NSLog(@"400");
        //self.Status.text = @"Invalid Code";
    } else if (request.responseStatusCode == 403) {
        NSLog(@"403");
        //self.Status.text = @"Code already used";
    } else if (request.responseStatusCode == 200) {
        
        NSString *responseString = [request responseString];
        //NSLog(responseString);
        NSDictionary *responseDict = [responseString JSONValue];
        
        NSArray *JobResults = [responseDict objectForKey:@"GetOpenJobsResult"];
        
        for (NSDictionary *dictJob in JobResults)
        {
            @autoreleasepool {
                JobDataObject *objSearchResult = [[JobDataObject alloc] init];
                objSearchResult.JobTitle =               [dictJob objectForKey:@"JobTitle"];
                objSearchResult.Experience =             [dictJob objectForKey:@"Experience"];
                objSearchResult.RID =                     [[dictJob objectForKey:@"RID"] integerValue];
                objSearchResult.Location =               [dictJob objectForKey:@"Location"];
                objSearchResult.JD =         [dictJob objectForKey:@"JD"];
                objSearchResult.Posted =               [dictJob objectForKey:@"PostedOn"];
                
                [self.JobDataFromWS addObject:objSearchResult];
            }
        }
        
        self.tblJobs.backgroundView = nil;
        self.tblJobs.dataSource = self;
        self.tblJobs.delegate = self;
        [self.tblJobs reloadData];
        
    }
    
    else {
        NSLog(@"Error");
        //self.Status.text = @"Unexpected error";
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Connection Error" message:@"Unable to fetch to Jobs" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [error show];
    NSLog(@"Exception %@",request.error.localizedDescription);
    //NSError *error = [request error];
    //NSLog(error.localizedDescription);
    //self.Status.text = error.localizedDescription;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.JobDataFromWS count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    OpenJobCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OpenJobCell" owner:self options:nil];
        //cell = [[JobDetailCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] ;
        cell = [nib objectAtIndex:0];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    JobDataObject *objBO = (JobDataObject*)[self.JobDataFromWS objectAtIndex:indexPath.row];
    [cell setParameters:objBO];
    
    //cell.textLabel.text = objBO;
    
    // cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButton;
    JobDataObject *obj = [self.JobDataFromWS objectAtIndex:indexPath.row];
    
    /*UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Item Selected"
                          message:[NSString stringWithFormat:@"Item %@", obj.JobTitle]
                          
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [alert show];*/
    
    
    JobDetail *objVC = [[JobDetail alloc] init];
     objVC.jobData = obj;
     [self.navigationController pushViewController:objVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}




@end
