//
//  AutoLayoutSubViewController1.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AutoLayoutSubViewController1.h"

@implementation AutoLayoutSubViewController1

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.showControl_gap        = YES;
    self.showControl_offStart   = NO;
    self.showControl_offEnd     = NO;
    [self buildDashBoard];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLayout) name:UpdateLayoutNoticeStr object:nil];
    
    self.explainTextView.text = @"/**\n*  根据子view自动布局 自动计算:起始点，结束点，间距（三值相等）\n*  说明： 在父类view尺寸不等于需求尺寸时，会显示日志并且取消布局\n*/\n+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center;";
}

- (void)updateLayout
{
    [UIView animateWithDuration:0.5f animations:^{
        [UIView BearAutoLayViewArray:self.subViewArray layoutAxis:self.layoutAxis center:self.center];
    }];
}

@end