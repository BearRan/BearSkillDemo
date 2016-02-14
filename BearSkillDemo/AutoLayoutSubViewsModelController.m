//
//  AutoLayoutSubViewsModelController.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AutoLayoutSubViewsModelController.h"

@implementation AutoLayoutSubViewsModelController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"AutoLayoutSubViews";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createDashBoard];
}

- (void)createDashBoard
{
    UIView *dashBoardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 120)];
    dashBoardView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:dashBoardView];
    [dashBoardView setMaxY:self.view.maxY];
    
    CGFloat btn_height  = 30;
    UIFont  *textFont   = [UIFont systemFontOfSize:14.0f];
    
    NSMutableArray *subViewArray = [[NSMutableArray alloc] init];
    
    _startLayoutBtn = [[UIButton alloc] init];
    [_startLayoutBtn setTitle:@"开始布局" forState:UIControlStateNormal];
    _startLayoutBtn.titleLabel.font = textFont;
    [_startLayoutBtn sizeToFit];
    [_startLayoutBtn setHeight:btn_height];
    [dashBoardView addSubview:_startLayoutBtn];
    [subViewArray addObject:_startLayoutBtn];
    
    _changeAxisBtn = [[UIButton alloc] init];
    [_changeAxisBtn setTitle:@"X轴" forState:UIControlStateNormal];
    _changeAxisBtn.titleLabel.font = textFont;
    [_changeAxisBtn sizeToFit];
    [_changeAxisBtn setHeight:btn_height];
    [dashBoardView addSubview:_changeAxisBtn];
    [subViewArray addObject:_changeAxisBtn];
    
    _centerSelectBtn = [[UIButton alloc] init];
    [_centerSelectBtn setTitle:@"居中" forState:UIControlStateNormal];
    _centerSelectBtn.titleLabel.font = textFont;
    [_centerSelectBtn sizeToFit];
    [_centerSelectBtn setHeight:btn_height];
    [dashBoardView addSubview:_centerSelectBtn];
    [subViewArray addObject:_centerSelectBtn];
    
    
    //  三个调整值的view
    CGFloat changeView_width    = 30;
    CGFloat changeView_height   = 80;
    
    _changeValue_gap = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, changeView_width, changeView_height)];
    [dashBoardView addSubview:_changeValue_gap];
    [subViewArray addObject:_changeValue_gap];
    
    _changeValue_offStart = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, changeView_width, changeView_height)];
    [dashBoardView addSubview:_changeValue_offStart];
    [subViewArray addObject:_changeValue_offStart];
    
    _changeValue_offEnd = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, changeView_width, changeView_height)];
    [dashBoardView addSubview:_changeValue_offEnd];
    [subViewArray addObject:_changeValue_offEnd];
    
    [UIView BearAutoLayViewArray:subViewArray layoutAxis:kLAYOUT_AXIS_X center:YES];
    
    
    //  三个调整值的view的说明label
    UIFont *labelFont = [UIFont systemFontOfSize:11.0f];
    
    _gapLabel = [[UILabel alloc] init];
    _gapLabel.text = @"间距";
    _gapLabel.textColor = [UIColor whiteColor];
    _gapLabel.font = labelFont;
    [dashBoardView addSubview:_gapLabel];
    [_gapLabel BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:_changeValue_gap parentRelation:NO distance:5.0f center:YES sizeToFit:YES];

    _offStartLabel = [[UILabel alloc] init];
    _offStartLabel.text = @"offStart";
    _offStartLabel.textColor = [UIColor whiteColor];
    _offStartLabel.font = labelFont;
    [dashBoardView addSubview:_offStartLabel];
    [_offStartLabel BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:_changeValue_offStart parentRelation:NO distance:5.0f center:YES sizeToFit:YES];
    
    _offEndLabel = [[UILabel alloc] init];
    _offEndLabel.text = @"offEnd";
    _offEndLabel.textColor = [UIColor whiteColor];
    _offEndLabel.font = labelFont;
    [dashBoardView addSubview:_offEndLabel];
    [_offEndLabel BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:_changeValue_offEnd parentRelation:NO distance:5.0f center:YES sizeToFit:YES];
}

@end





