//
//  OpenJobs.h
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenJobs : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblJobs;
@property (strong, nonatomic) NSMutableArray *JobDataFromWS;

@end
