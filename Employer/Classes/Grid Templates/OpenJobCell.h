//
//  OpenJobCell.h
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobDataObject.h"
@interface OpenJobCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *JobOpeningName;
@property (weak, nonatomic) IBOutlet UITextView *JobData;

-(void)setParameters:(JobDataObject*) jd;
@end
