//
//  AutoLayoutSubViewController4.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AutoLayoutSubViewController4.h"

@implementation AutoLayoutSubViewController4

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
    
    self.showControl_gap        = YES;
    self.showControl_offStart   = YES;
    self.showControl_offEnd     = YES;
    [self buildDashBoard];
    
    self.explainTextView.text = @"根据子view自动布局 需要设置:起始点，结束点，间距\n说明： 在父类view尺寸不等于需求尺寸时，会自动变化\n+ (void)BearAutoLayViewArray:(NSMutableArray *)viewArray layoutAxis:(kLAYOUT_AXIS)layoutAxis center:(BOOL)center offStart:(CGFloat)offStart offEnd:(CGFloat)offEnd gapDistance:(CGFloat)gapDistance;";
}

- (void)updateLayout
{
    if (self.startLayout == YES) {
        [UIView animateWithDuration:0.5f animations:^{
            [UIView BearAutoLayViewArray:self.subViewArray layoutAxis:self.layoutAxis center:self.center offStart:self.changeValue_offStart.value offEnd:self.changeValue_offEnd.value gapDistance:self.changeValue_gap.value];
        }];
    }
}

@end
