//
//  AutoLayoutSubViews.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AutoLayoutSubViews.h"

@interface AutoLayoutSubViews ()
{
    
}

@end

@implementation AutoLayoutSubViews

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.showControl_gap        = YES;
    self.showControl_offStart   = NO;
    self.showControl_offEnd     = NO;
    [self buildDashBoard];
}

@end
