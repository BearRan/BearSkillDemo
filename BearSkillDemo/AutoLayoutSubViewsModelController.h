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

//  DashBoard
@property (strong, nonatomic) UIView    *dashBoardView;
@property (strong, nonatomic) UIButton  *startLayoutBtn;
@property (strong, nonatomic) UIButton  *changeAxisBtn;
@property (strong, nonatomic) UIButton  *centerSelectBtn;

@property (strong, nonatomic) ChangeValueWithBtnView *changeValue_gap;
@property (strong, nonatomic) ChangeValueWithBtnView *changeValue_offStart;
@property (strong, nonatomic) ChangeValueWithBtnView *changeValue_offEnd;

@property (strong, nonatomic) UILabel   *gapLabel;
@property (strong, nonatomic) UILabel   *offStartLabel;
@property (strong, nonatomic) UILabel   *offEndLabel;

@property (assign, nonatomic) BOOL  showControl_gap;
@property (assign, nonatomic) BOOL  showControl_offStart;
@property (assign, nonatomic) BOOL  showControl_offEnd;

- (void)buildDashBoard;


//  Performance
@property (strong, nonatomic) UIView            *canvasView;
@property (strong, nonatomic) NSMutableArray    *subViewArray;

@end
