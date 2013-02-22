//
//  WebConnector.m
//  Employer
//
//  Created by Sanjit Janak Nair on 18/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "Authenticate.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "JobDataObject.h"

@implementation Authenticate

- (NSString*) AuthenticateMe: (NSString*) UID : (NSString*) Password
{
    self.UserName = UID;
    self.Password = Password;
    self.RID = nil;
    [self StartWebService];
    return self.RID;
}


- (void) StartWebService
{
    NSString *URL = WEB_SERVICE_URL;
    URL = [URL stringByAppendingFormat:@"/%@/%@/%@",@"AuthenticateUser",self.UserName,self.Password];
    
    NSURL *wsURL = [NSURL URLWithString:URL];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:wsURL];
    
    [request setDelegate:self];
    [request startSynchronous];
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
        
        @try
        {
            
            NSString *responseString = [request responseString];
            //NSLog(responseString);
            NSDictionary *responseDict = [responseString JSONValue];
            
            NSDictionary *Result = [responseDict objectForKey:@"AuthenticateUserResult"];
            NSLog(@"%@",[Result objectForKey:@"RID"]);
            self.RID = [Result objectForKey:@"RID"];
        }
        @catch (NSException *e)
        {
            NSLog(@"Exception %@",[e reason]);
            self.RID = nil;
        }
    }
    else {
        NSLog(@"Error");
        //self.Status.text = @"Unexpected error";
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    self.RID = nil;
    NSError *error = [request error];
    NSLog(@"Error %@",error.localizedDescription);
    //NSLog(error.localizedDescription);
    //self.Status.text = error.localizedDescription;
}




@end
