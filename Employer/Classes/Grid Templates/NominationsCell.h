//
//  NominationsCell.h
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NominationObject.h"
@interface NominationsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *CandidateName;
@property (weak, nonatomic) IBOutlet UILabel *NominatedForJobTitle;
@property (weak, nonatomic) IBOutlet UILabel *NominationNotes;
@property NSString *RID;


- (void)setParameters:(NominationObject*)data;

@end
