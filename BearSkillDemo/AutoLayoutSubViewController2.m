//
//  AutoLayoutSubViewController2.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AutoLayoutSubViewController2.h"

@implementation AutoLayoutSubViewController2

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
    self.showControl_offStart   = YES;
    self.showControl_offEnd     = YES;
    [self buildDashBoard];
    
    self.explainTextView.text = @"根据子view自动布局 需要设置:起始点，结束点; 自动计算:间距\n说明： 在父类view尺寸不等于需求尺寸时，会显示日志并且取消布局\n+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center offStart:(CGFloat)offStart offEnd:(CGFloat)offEnd;";
}

- (void)updateLayout
{
    if (self.startLayout == YES) {
        [UIView animateWithDuration:0.5f animations:^{
            [UIView BearAutoLayViewArray:self.subViewArray layoutAxis:self.layoutAxis center:self.center offStart:self.changeValue_offStart.value offEnd:self.changeValue_offEnd.value];
        }];
    }
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
    [UIView BearAutoLayViewArray:subViewArray layoutAxis:kLAYOUT_AXIS_X center:YES offStart:20 offEnd:20];
}

@end
