//
//  AutoLayoutSubViewController1.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AutoLayoutSubViewController1.h"

@implementation AutoLayoutSubViewController1

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLayout) name:UpdateLayoutNoticeStr object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UpdateLayoutNoticeStr object:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.showControl_gap        = NO;
    self.showControl_offStart   = NO;
    self.showControl_offEnd     = NO;
    [self buildDashBoard];
    
    self.explainTextView.text = @"根据子view自动布局 自动计算:起始点，结束点，间距（三值相等）\n说明： 在父类view尺寸不等于需求尺寸时，会显示日志并且取消布局\n\n+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center;";
}

- (void)updateLayout
{
    [UIView animateWithDuration:0.5f animations:^{
        [UIView BearAutoLayViewArray:self.subViewArray layoutAxis:self.layoutAxis center:self.center];
    }];
}


/**
 *  最简代码使用demo (不能运行，只能说明最简使用方法)
 */
- (void)simpleCodeExplain
{
    NSMutableArray *subViewArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.view addSubview:view];
        [subViewArray addObject:view];
    }
    
    //  自动布局
    [UIView BearAutoLayViewArray:subViewArray layoutAxis:kLAYOUT_AXIS_X center:YES];
}


@end
