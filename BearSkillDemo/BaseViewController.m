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
    NSArray     *descriptionArray;
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
    
    descriptionArray = [[NSArray alloc] initWithObjects:
                        @"根据子view自动布局 自动计算:起始点，结束点，间距（三值相等）",
                        @"根据子view自动布局 需要设置:起始点，结束点; 自动计算:间距",
                        @"根据子view自动布局 需要设置:间距; 自动计算:起始点，结束点",
                        @"根据子view自动布局 需要设置:起始点，结束点，间距",
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
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, WIDTH - 30, 30)];
    detailLabel.font = [UIFont systemFontOfSize:11.0f];
    detailLabel.text = descriptionArray[row];
    [cell addSubview:detailLabel];
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
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
