//
//  Nominations.m
//  Employer
//
//  Created by Sanjit Janak Nair on 16/02/13.
//  Copyright (c) 2013 HireCraft Software Pvt. Ltd. All rights reserved.
//

#import "Nominations.h"
#import "Grid Templates/NominationsCell.h"
#import "RedirectToWebPage.h"

@interface Nominations ()

@end

@implementation Nominations

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self PrepareDataSource];
    self.grdNominations.backgroundView = nil;
    self.grdNominations.dataSource = self;
    self.grdNominations.delegate = self;
    // Do any additional setup after loading the view from its nib.
    self.title = @"Nominations";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Data Binding from Web Service
- (void) PrepareDataSource
{
    self.dtNominations = [[NSMutableArray alloc]initWithCapacity:5];
    
    NominationObject *nm = [[NominationObject alloc] init];
    nm.JobTitle = @"Test";
    nm.CandidateName = @"Sanjit";
    nm.AdditionalInfo = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
    
    [self.dtNominations addObject:nm];
    [self.dtNominations addObject:nm];
    [self.dtNominations addObject:nm];
    [self.dtNominations addObject:nm];
}

//#pragma mark - Table Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dtNominations.count;
}


//#pragma mark - Table Binding
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";

    NominationsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NominationsCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        NominationObject *sel = [self.dtNominations objectAtIndex:indexPath.row];
        sel.RID = [NSString stringWithFormat:@"%d",indexPath.row];
        [cell setParameters:sel];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RedirectToWebpage *p = [[RedirectToWebpage alloc]init];
    [p setIPURL:@"http://www.google.com"];
    [self.navigationController pushViewController:p animated:YES];
//    UIAlertView *alert = [[UIAlertView alloc]
//                          initWithTitle:@"Item Selected"
//                          message:[NSString stringWithFormat:@"Item %d", indexPath.row]
//                          
//                          delegate:self
//                          cancelButtonTitle:@"OK"
//                          otherButtonTitles:nil];
//    
//    [alert show];
}

- (void)viewDidUnload {
    [self setGrdNominations:nil];
    [super viewDidUnload];
}
@end
