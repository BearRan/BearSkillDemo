//
//  ChangeValueWithBtnView.m
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangeValueWithBtnView.h"

@implementation ChangeValueWithBtnView

static float deltaValue = 1.5;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        self = nil;
    }
    
    _value = 0;
    self.backgroundColor = [UIColor clearColor];
    [self createUI];
    
    return self;
}

- (void)createUI
{
    CGFloat btn_width   = self.width;
    CGFloat btn_height  = 20;
    
    NSMutableArray *subViewArray = [[NSMutableArray alloc] init];
    
    _plusBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_plusBtn setTitle:@"+" forState:UIControlStateNormal];
    [_plusBtn setMyBorder:[UIColor whiteColor] borderWidth:1.0f];
    [_plusBtn addTarget:self action:@selector(plusBtn_Event) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_plusBtn];
    [subViewArray addObject:_plusBtn];
    
    _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btn_width, 30)];
    _valueLabel.text = [NSString stringWithFormat:@"%.1f", _value];
    _valueLabel.textColor = [UIColor whiteColor];
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    [_valueLabel setMyBorder:[UIColor whiteColor] borderWidth:1.0f];
    [self addSubview:_valueLabel];
    [subViewArray addObject:_valueLabel];
    
    _minusBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btn_width, btn_height)];
    [_minusBtn setTitle:@"-" forState:UIControlStateNormal];
    [_minusBtn setMyBorder:[UIColor whiteColor] borderWidth:1.0f];
    [_minusBtn addTarget:self action:@selector(minusBtn_Event) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_minusBtn];
    [subViewArray addObject:_minusBtn];
    
    [UIView BearAutoLayViewArray:subViewArray layoutAxis:kLAYOUT_AXIS_Y center:YES];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (void)plusBtn_Event
{
    _value = _value + deltaValue;
    _valueLabel.text = [NSString stringWithFormat:@"%.1f", _value];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UpdateLayoutNoticeStr object:nil];
}

- (void)minusBtn_Event
{
    if (_value <= 0) {
        _value = 0;
        return;
    }
    
    _value = _value - deltaValue;
    _valueLabel.text = [NSString stringWithFormat:@"%.1f", _value];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UpdateLayoutNoticeStr object:nil];
}

@end
