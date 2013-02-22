//
//  Nominations.h
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grid Templates/NominationsCell.h"

@interface Nominations : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray *dtNominations;
@property (weak, nonatomic) IBOutlet UITableView *grdNominations;

@end
