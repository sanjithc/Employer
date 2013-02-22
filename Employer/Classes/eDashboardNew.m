//
//  eDashboardNew.m
//  Employer
//
//  Created by Sanjit Janak Nair on 18/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "eDashboardNew.h"
#import "OpenJobs.h"
#import "Nominations.h"
#import "Interviews.h"
#import "OpenJobs.h"

@interface eDashboardNew ()

@end

@implementation eDashboardNew

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem *logout = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
        
        [logout setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIColor clearColor],
                                        UITextAttributeTextColor,
                                        [UIColor whiteColor],
                                        UITextAttributeTextShadowColor,
                                        [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
                                        UITextAttributeTextShadowOffset,
                                        [UIFont fontWithName:@"QuicksandBold-Regular" size:24.0],
                                        UITextAttributeFont,
                                        nil] forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = logout;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dashboard";
    self.tblDash.backgroundView = nil;
    self.tblDash.dataSource = self;
    self.tblDash.delegate = self;
    self.dtDashboard = [[NSMutableArray alloc] initWithCapacity:4];
    [self PrepareDashboard];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) logout:(UIBarButtonItem*)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged Out" message:@"Logged Out Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)PrepareDashboard
{
    
    NSArray *data = [NSArray arrayWithObjects:@"Open Vacancies", @"10",@"1", nil];
    
    [self.dtDashboard addObject:data];
    
    NSArray *data1 = [NSArray arrayWithObjects:@"Nominations", @"7",@"2", nil];
    
    [self.dtDashboard addObject:data1];
    
    NSArray *data2 = [NSArray arrayWithObjects:@"Interviews", @"3",@"3", nil];
    
    [self.dtDashboard addObject:data2];
    
    NSArray *data3 = [NSArray arrayWithObjects:@"Offers", @"4",@"4", nil];
    
    [self.dtDashboard addObject:data3];
    
    [self.tblDash reloadData];
    
}

- (void)viewDidUnload {
    [self setTblDash:nil];
    [super viewDidUnload];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dtDashboard count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier] ;
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor colorWithRed:244.0 green:243.0 blue:224.0 alpha:1];
        NSArray *sel = [self.dtDashboard objectAtIndex:indexPath.row];
        
        NSString *Title = [sel objectAtIndex:0];
        NSString *Count = [sel objectAtIndex:1];
        cell.textLabel.text = Title;
        cell.detailTextLabel.text = Count;
        cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
        cell.detailTextLabel.textColor = [UIColor blueColor];
        cell.tag = (NSInteger) [sel objectAtIndex:2];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"Open Vacancies");
            OpenJobs *vac = [[OpenJobs alloc]initWithNibName:@"OpenJobs" bundle:nil];
            [self.navigationController pushViewController:vac animated:YES];
            break;
        }
        case 1:
        {
            NSLog(@"Nominations");
            Nominations *nom = [[Nominations alloc] initWithNibName:@"Nominations" bundle:nil];
            [self.navigationController pushViewController:nom animated:YES];
            break;
        }
        case 2:
        {
            NSLog(@"Interviews");
            Interviews *ints = [[Interviews alloc] initWithNibName:@"Interviews" bundle:nil];
            [self.navigationController pushViewController:ints animated:YES];
            break;
        }
        case 3:
        {
            NSLog(@"Offers");
            Nominations *ints = [[Nominations alloc] initWithNibName:@"Nominations" bundle:nil];
            [self.navigationController pushViewController:ints animated:YES];
            break;
        }
        default:
            break;
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


@end
