//
//  JobDetail.h
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HireCraft Objects/JobDataObject.h"

@interface JobDetail : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *txtJobTitle;
@property (weak, nonatomic) IBOutlet UILabel *txtBranchName;
@property (weak, nonatomic) IBOutlet UILabel *txtOpenings;
@property (weak, nonatomic) IBOutlet UILabel *txtCreatedDate;
@property (weak, nonatomic) IBOutlet UITextView *txtJD;
@property (weak, nonatomic) JobDataObject *jobData;
@end
