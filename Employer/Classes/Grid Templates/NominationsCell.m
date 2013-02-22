//
//  NominationsCell.m
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "NominationsCell.h"
#import "NominationObject.h"

@implementation NominationsCell

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

- (void)setParameters:(NominationObject*)data
{
    self.NominatedForJobTitle.text = data.JobTitle;
    self.CandidateName.text = data.CandidateName;
    self.NominationNotes.text = data.AdditionalInfo;
    self.RID = data.RID;
}
@end
