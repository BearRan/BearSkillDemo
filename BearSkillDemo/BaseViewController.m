//
//  BaseViewController.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseViewController.h"
#import "AutoLayoutSubViewController1.h"
#import "AutoLayoutSubViewController2.h"
#import "AutoLayoutSubViewController3.h"
#import "AutoLayoutSubViewController4.h"

static NSString *cell_autoLauoutSubViews1 = @"AutoLayoutSubViewController1";
static NSString *cell_autoLauoutSubViews2 = @"AutoLayoutSubViewController2";
static NSString *cell_autoLauoutSubViews3 = @"AutoLayoutSubViewController3";
static NSString *cell_autoLauoutSubViews4 = @"AutoLayoutSubViewController4";

@interface BaseViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *tableView;
    NSArray     *tableDataArray;
}

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    tableDataArray = [[NSArray alloc] initWithObjects:
                      cell_autoLauoutSubViews1,
                      cell_autoLauoutSubViews2,
                      cell_autoLauoutSubViews3,
                      cell_autoLauoutSubViews4,
                      nil];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = tableDataArray[row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    
    if ([tableDataArray[row] isEqualToString:cell_autoLauoutSubViews1]) {
        AutoLayoutSubViewController1 *destinationVC = [[AutoLayoutSubViewController1 alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    
    else if ([tableDataArray[row] isEqualToString:cell_autoLauoutSubViews2]) {
        AutoLayoutSubViewController2 *destinationVC = [[AutoLayoutSubViewController2 alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    
    else if ([tableDataArray[row] isEqualToString:cell_autoLauoutSubViews3]) {
        AutoLayoutSubViewController3 *destinationVC = [[AutoLayoutSubViewController3 alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    
    else if ([tableDataArray[row] isEqualToString:cell_autoLauoutSubViews4]) {
        AutoLayoutSubViewController4 *destinationVC = [[AutoLayoutSubViewController4 alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
}

@end
