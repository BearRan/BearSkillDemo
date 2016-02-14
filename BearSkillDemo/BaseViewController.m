//
//  BaseViewController.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseViewController.h"
#import "AutoLayoutSubViews.h"

static NSString *cell_autoLauoutSubViews = @"autoLauoutSubViews";

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
    tableDataArray = [[NSArray alloc] initWithObjects:cell_autoLauoutSubViews, nil];
    
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
    
    if ([tableDataArray[row] isEqualToString:cell_autoLauoutSubViews]) {
        AutoLayoutSubViews *destinationVC = [[AutoLayoutSubViews alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
}

@end
