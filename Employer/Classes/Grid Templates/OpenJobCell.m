//
//  OpenJobCell.m
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "OpenJobCell.h"
#import "JobDataObject.h"

@implementation OpenJobCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setParameters:(JobDataObject*)objD
{
    self.JobOpeningName.text = objD.JobTitle;
    NSString *JD = @"";
    //JD = [JD stringByAppendingString:objD.JD];
    //JD = [JD stringByAppendingString:objD.Location];
    JD = [JD stringByAppendingString:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."];
    self.JobData.text = JD;
}

@end
