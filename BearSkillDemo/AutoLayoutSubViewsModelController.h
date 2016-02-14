//
//  AutoLayoutSubViewsModelController.h
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeValueWithBtnView.h"

@interface AutoLayoutSubViewsModelController : UIViewController

@property (strong, nonatomic) UIButton  *startLayoutBtn;
@property (strong, nonatomic) UIButton  *changeAxisBtn;
@property (strong, nonatomic) UIButton  *centerSelectBtn;

@property (strong, nonatomic) ChangeValueWithBtnView *changeValue_gap;
@property (strong, nonatomic) ChangeValueWithBtnView *changeValue_offStart;
@property (strong, nonatomic) ChangeValueWithBtnView *changeValue_offEnd;

@property (strong, nonatomic) UILabel   *gapLabel;
@property (strong, nonatomic) UILabel   *offStartLabel;
@property (strong, nonatomic) UILabel   *offEndLabel;

@end
