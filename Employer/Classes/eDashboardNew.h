//
//  eDashboardNew.h
//  Employer
//
//  Created by Sanjit Janak Nair on 18/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eDashboardNew : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dtDashboard;
@property (weak, nonatomic) IBOutlet UITableView *tblDash;

@end
