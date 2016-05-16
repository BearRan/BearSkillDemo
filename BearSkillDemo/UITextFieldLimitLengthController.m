//
//  UITextFieldLimitLengthController.m
//  BearSkillDemo
//
//  Created by apple on 16/5/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UITextFieldLimitLengthController.h"
#import "UITextField+BearSet.h"
#import "ChangeValueWithBtnView.h"

@implementation UITextFieldLimitLengthController
{
    UITextField             *_textField;
    ChangeValueWithBtnView  *_changeValueBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, WIDTH - 20, 30)];
    _textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: _textField];
    
    _changeValueBtn = [[ChangeValueWithBtnView alloc] initWithFrame:CGRectMake(0, 0, 60, 150)];
    [self.view addSubview:_changeValueBtn];
    [_changeValueBtn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:_textField parentRelation:NO distance:20 center:YES];
}

@end
