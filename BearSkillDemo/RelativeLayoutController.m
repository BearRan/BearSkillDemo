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
    self.title = @"RelativeLayout";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLayOut) name:UpdateLayoutNoticeStr object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UpdateLayoutNoticeStr object:nil];
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
    [self createPerformanceView];
}

- (void)createPerformanceView
{
    _viewA = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    _viewA.backgroundColor = [UIColor colorWithRed:0 green:0.98 blue:0.4 alpha:1.0f];
    [self.view addSubview:_viewA];
    [_viewA BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    _viewB = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _viewB.backgroundColor = [UIColor orangeColor];
    [_viewA addSubview:_viewB];
    [_viewB BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

- (void)buildDashBoard
{
    UIView *leftDashView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    [_dashBoardView addSubview:leftDashView];
    [leftDashView BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:20 center:YES];
    
    CGFloat btn_width   = 50;
    CGFloat btn_height  = 20;
    UIFont  *btnFont    = [UIFont systemFontOfSize:13.0f];
    
    //  设置方向
    _upBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_upBtn setTitle:@"Up" forState:UIControlStateNormal];
    _upBtn.titleLabel.font = btnFont;
    [_upBtn addTarget:self action:@selector(upBtn_Event) forControlEvents:UIControlEventTouchUpInside];
    [leftDashView addSubview:_upBtn];
    [_upBtn BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _downBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_downBtn setTitle:@"Down" forState:UIControlStateNormal];
    _downBtn.titleLabel.font = btnFont;
    [_downBtn addTarget:self action:@selector(downBtn_Event) forControlEvents:UIControlEventTouchUpInside];
    [leftDashView addSubview:_downBtn];
    [_downBtn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_leftBtn setTitle:@"Left" forState:UIControlStateNormal];
    _leftBtn.titleLabel.font = btnFont;
    [_leftBtn addTarget:self action:@selector(leftBtn_Event) forControlEvents:UIControlEventTouchUpInside];
    [leftDashView addSubview:_leftBtn];
    [_leftBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_rightBtn setTitle:@"Right" forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = btnFont;
    [_rightBtn addTarget:self action:@selector(rightBtn_Event) forControlEvents:UIControlEventTouchUpInside];
    [leftDashView addSubview:_rightBtn];
    [_rightBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:0 center:YES];
    
    _centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_centerBtn setTitle:@"Center" forState:UIControlStateNormal];
    _centerBtn.titleLabel.font = btnFont;
    [_centerBtn addTarget:self action:@selector(centerBtn_Event) forControlEvents:UIControlEventTouchUpInside];
    [leftDashView addSubview:_centerBtn];
    [_centerBtn BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    
    //  设置父子关系
    _parentRelation = YES;
    _parentRelationBtn = [[UIButton alloc] init];
    [_parentRelationBtn setTitle:@"父子类关系" forState:UIControlStateNormal];
    _parentRelationBtn.titleLabel.font = btnFont;
    [_parentRelationBtn addTarget:self action:@selector(parentRalationBtn_Event:) forControlEvents:UIControlEventTouchUpInside];
    [_dashBoardView addSubview:_parentRelationBtn];
    [_parentRelationBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:leftDashView parentRelation:NO distance:20 center:YES sizeToFit:YES];
    
    
    //  设置居中关系
    _center = YES;
    _centerRelationBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, btn_height)];
    [_centerRelationBtn setTitle:@"居中" forState:UIControlStateNormal];
    _centerRelationBtn.titleLabel.font = btnFont;
    [_centerRelationBtn addTarget:self action:@selector(centerRelationBtn_Event:) forControlEvents:UIControlEventTouchUpInside];
    [_dashBoardView addSubview:_centerRelationBtn];
    [_centerRelationBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:_parentRelationBtn parentRelation:NO distance:20 center:YES];
    
    
    //  控制相对距离
    _changeValueBtn = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, 40, 80)];
    [_dashBoardView addSubview:_changeValueBtn];
    [_changeValueBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:20 center:YES];
    
    UILabel *noticeLabel = [[UILabel alloc] init];
    noticeLabel.text = @"相对距离";
    noticeLabel.textColor = [UIColor whiteColor];
    noticeLabel.font = [UIFont systemFontOfSize:14.0f];
    [_dashBoardView addSubview:noticeLabel];
    [noticeLabel BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:_changeValueBtn parentRelation:NO distance:0 center:YES sizeToFit:YES];
}


//  点击事件
- (void)upBtn_Event{
    _dir = kDIR_UP;
    [self updateLayOut];
}

- (void)downBtn_Event{
    _dir = kDIR_DOWN;
    [self updateLayOut];
}

- (void)leftBtn_Event{
    _dir = kDIR_LEFT;
    [self updateLayOut];
}

- (void)rightBtn_Event{
    _dir = kDIR_RIGHT;
    [self updateLayOut];
}

- (void)centerBtn_Event{
    [UIView animateWithDuration:0.5f animations:^{
        if (_parentRelation == YES) {
            [_viewB BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
        }else{
            nil;
        }
    }];
}

- (void)parentRalationBtn_Event:(UIButton *)sender
{
    if (_parentRelation == YES) {
        _parentRelation = NO;
        [self.view addSubview:_viewB];
        [sender setTitle:@"非父子类关系" forState:UIControlStateNormal];
        [sender sizeToFit];
        [self updateLayOut];
    }
    else{
        _parentRelation = YES;
        [_viewA addSubview:_viewB];
        [sender setTitle:@"父子类关系" forState:UIControlStateNormal];
        [sender sizeToFit];
        [self updateLayOut];
    }
}

- (void)centerRelationBtn_Event:(UIButton *)sender
{
    if (_center == YES) {
        _center = NO;
        [sender setTitle:@"不居中" forState:UIControlStateNormal];
        [sender sizeToFit];
        [self updateLayOut];
    }
    else{
        _center = YES;
        [sender setTitle:@"居中" forState:UIControlStateNormal];
        [sender sizeToFit];
        [self updateLayOut];
    }
}

- (void)updateLayOut
{
    [UIView animateWithDuration:0.5f animations:^{
        if (_parentRelation == YES) {
            [_viewB BearSetRelativeLayoutWithDirection:_dir destinationView:nil parentRelation:YES distance:_changeValueBtn.value center:_center];
        }else{
            [_viewB BearSetRelativeLayoutWithDirection:_dir destinationView:_viewA parentRelation:NO distance:_changeValueBtn.value center:_center];
        }
    }];
}

@end



