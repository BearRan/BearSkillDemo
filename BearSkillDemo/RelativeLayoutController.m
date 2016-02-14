//
//  RelativeLayoutController.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RelativeLayoutController.h"

@implementation RelativeLayoutController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"AutoLayoutSubViews";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dashBoardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 120)];
    _dashBoardView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_dashBoardView];
    [_dashBoardView setMaxY:self.view.maxY];
    
    [self buildDashBoard];
}

- (void)buildDashBoard
{
    UIView *leftDashView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    [_dashBoardView addSubview:leftDashView];
    [leftDashView BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:40 center:YES];
    
    CGFloat btn_width   = 50;
    CGFloat btn_height  = 20;
    UIFont  *btnFont    = [UIFont systemFontOfSize:13.0f];
    
    _upBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_upBtn setTitle:@"Up" forState:UIControlStateNormal];
    _upBtn.titleLabel.font = btnFont;
    [leftDashView addSubview:_upBtn];
    [_upBtn BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _downBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_downBtn setTitle:@"Down" forState:UIControlStateNormal];
    _downBtn.titleLabel.font = btnFont;
    [leftDashView addSubview:_downBtn];
    [_downBtn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_leftBtn setTitle:@"Left" forState:UIControlStateNormal];
    _leftBtn.titleLabel.font = btnFont;
    [leftDashView addSubview:_leftBtn];
    [_leftBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_rightBtn setTitle:@"Right" forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = btnFont;
    [leftDashView addSubview:_rightBtn];
    [_rightBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_centerBtn setTitle:@"Center" forState:UIControlStateNormal];
    _centerBtn.titleLabel.font = btnFont;
    [leftDashView addSubview:_centerBtn];
    [_centerBtn BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

@end
