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
    
    _dashBoardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 120)];
    _dashBoardView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_dashBoardView];
    [_dashBoardView setMaxY:self.view.maxY];
    
    [self createPerformanceView];
}


//  布局演示界面
- (void)createPerformanceView
{
    //  代码说明TextView
    _explainTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, _dashBoardView.y - 60 - 5, WIDTH - 20, 60)];
    _explainTextView.editable = NO;
    _explainTextView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_explainTextView];
    
    
    CGFloat gapWidth    = 30;
    CGFloat viewWidth   = 40;
    CGFloat viewHeight  = 40;
    
    _canvasView = [[UIView alloc] initWithFrame:CGRectMake(gapWidth, NAV_STA + gapWidth, WIDTH - gapWidth * 2, _explainTextView.y - NAV_STA - gapWidth * 2)];
    _canvasView.backgroundColor = [UIColor colorWithRed:0 green:0.98 blue:0.4 alpha:1.0f];
    [self.view addSubview:_canvasView];
    
    _subViewArray = [[NSMutableArray alloc] init];
    NSArray *colcorArray = [[NSArray alloc] initWithObjects:
                            [UIColor orangeColor],
                            [UIColor yellowColor],
                            [UIColor blueColor],
                            [UIColor purpleColor],
                            [UIColor grayColor],
                            nil];
    
    for (int i = 0; i < [colcorArray count]; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10 * i, 10 * i, viewWidth, viewHeight)];
        view.backgroundColor = colcorArray[i];
        [_canvasView addSubview:view];
        [_subViewArray addObject:view];
    }
}


//  搭建控制台
- (void)buildDashBoard
{
    CGFloat btn_height  = 30;
    UIFont  *textFont   = [UIFont systemFontOfSize:14.0f];
    
    NSMutableArray *subViewArray = [[NSMutableArray alloc] init];
    
    _startLayout = NO;
    
    _startLayoutBtn = [[UIButton alloc] init];
    [_startLayoutBtn setTitle:@"开始布局" forState:UIControlStateNormal];
    _startLayoutBtn.titleLabel.font = textFont;
    [_startLayoutBtn sizeToFit];
    [_startLayoutBtn setHeight:btn_height];
    [_startLayoutBtn addTarget:self action:@selector(startLayoutBtn_Event:) forControlEvents:UIControlEventTouchUpInside];
    [_dashBoardView addSubview:_startLayoutBtn];
    [subViewArray addObject:_startLayoutBtn];
    
    
    _layoutAxis = kLAYOUT_AXIS_X;
    
    _changeAxisBtn = [[UIButton alloc] init];
    [_changeAxisBtn setTitle:@"X轴布局" forState:UIControlStateNormal];
    _changeAxisBtn.titleLabel.font = textFont;
    [_changeAxisBtn sizeToFit];
    [_changeAxisBtn setHeight:btn_height];
    [_changeAxisBtn addTarget:self action:@selector(changeAxisBtn_Event:) forControlEvents:UIControlEventTouchUpInside];
    [_dashBoardView addSubview:_changeAxisBtn];
    [subViewArray addObject:_changeAxisBtn];
    
    
    _center = YES;
    
    _centerSelectBtn = [[UIButton alloc] init];
    [_centerSelectBtn setTitle:@"居中" forState:UIControlStateNormal];
    _centerSelectBtn.titleLabel.font = textFont;
    [_centerSelectBtn sizeToFit];
    [_centerSelectBtn setHeight:btn_height];
    [_centerSelectBtn addTarget:self action:@selector(centerSelectBtn_Event:) forControlEvents:UIControlEventTouchUpInside];
    [_dashBoardView addSubview:_centerSelectBtn];
    [subViewArray addObject:_centerSelectBtn];
    
    
    
    //  三个调整值的view
    CGFloat changeView_width    = 40;
    CGFloat changeView_height   = 80;
    
    if (_showControl_gap == YES) {
        _changeValue_gap = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, changeView_width, changeView_height)];
        [_dashBoardView addSubview:_changeValue_gap];
        [subViewArray addObject:_changeValue_gap];
    }
    
    if (_showControl_offStart == YES) {
        _changeValue_offStart = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, changeView_width, changeView_height)];
        [_dashBoardView addSubview:_changeValue_offStart];
        [subViewArray addObject:_changeValue_offStart];
    }
    
    if (_showControl_offEnd == YES) {
        _changeValue_offEnd = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, changeView_width, changeView_height)];
        [_dashBoardView addSubview:_changeValue_offEnd];
        [subViewArray addObject:_changeValue_offEnd];
    }
    
    [UIView BearAutoLayViewArray:subViewArray layoutAxis:kLAYOUT_AXIS_X center:YES];
    
    
    
    //  三个调整值的view的说明label
    UIFont *labelFont = [UIFont systemFontOfSize:11.0f];
    
    if (_showControl_gap == YES) {
        _gapLabel = [[UILabel alloc] init];
        _gapLabel.text = @"间距";
        _gapLabel.textColor = [UIColor whiteColor];
        _gapLabel.font = labelFont;
        [_dashBoardView addSubview:_gapLabel];
        [_gapLabel BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:_changeValue_gap parentRelation:NO distance:5.0f center:YES sizeToFit:YES];
    }
    
    if (_showControl_offStart == YES) {
        _offStartLabel = [[UILabel alloc] init];
        _offStartLabel.text = @"offStart";
        _offStartLabel.textColor = [UIColor whiteColor];
        _offStartLabel.font = labelFont;
        [_dashBoardView addSubview:_offStartLabel];
        [_offStartLabel BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:_changeValue_offStart parentRelation:NO distance:5.0f center:YES sizeToFit:YES];
    }
    
    if (_showControl_offEnd == YES) {
        _offEndLabel = [[UILabel alloc] init];
        _offEndLabel.text = @"offEnd";
        _offEndLabel.textColor = [UIColor whiteColor];
        _offEndLabel.font = labelFont;
        [_dashBoardView addSubview:_offEndLabel];
        [_offEndLabel BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:_changeValue_offEnd parentRelation:NO distance:5.0f center:YES sizeToFit:YES];
    }

}


//  点击事件
- (void)startLayoutBtn_Event:(UIButton *)sender
{
    if (_startLayout == YES) {
        _startLayout = NO;
        [sender setTitle:@"开始布局" forState:UIControlStateNormal];
    }
    else{
        _startLayout = YES;
        [sender setTitle:@"重置布局" forState:UIControlStateNormal];
    }
    
    [self updateLayoutView];
}

- (void)changeAxisBtn_Event:(UIButton *)sender
{
    if (_layoutAxis == kLAYOUT_AXIS_X) {
        _layoutAxis = kLAYOUT_AXIS_Y;
        [sender setTitle:@"Y轴布局" forState:UIControlStateNormal];
    }
    else{
        _layoutAxis = kLAYOUT_AXIS_X;
        [sender setTitle:@"X轴布局" forState:UIControlStateNormal];
    }
    
    [self updateLayoutView];
}

- (void)centerSelectBtn_Event:(UIButton *)sender
{
    if (_center == YES) {
        _center = NO;
        [sender setTitle:@"不居中" forState:UIControlStateNormal];
        [sender sizeToFit];
    }
    else{
        _center = YES;
        [sender setTitle:@"居中" forState:UIControlStateNormal];
        [sender sizeToFit];
    }
    
    [self updateLayoutView];
}

- (void)updateLayoutView
{
    //  自动布局
    if (_startLayout == YES) {
        [[NSNotificationCenter defaultCenter] postNotificationName:UpdateLayoutNoticeStr object:nil];
    }
    
    //  重置布局
    else{
        [UIView animateWithDuration:0.5f animations:^{
            for (int i = 0; i < [_subViewArray count]; i++) {
                UIView *view = _subViewArray[i];
                [view setOrigin:CGPointMake(10 * i, 10 * i)];
            }
        }];
    }
}

@end





