//
//  BaseViewController.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BaseViewController.h"
#import "AutoLayoutSubViews.h"

@interface BaseViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *tableView;
}

@end

@implementation BaseViewController

- (void)viewDidLoad
{

    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AutoLayoutSubViews *destinationVC = [[AutoLayoutSubViews alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
}

@end
