//
//  RelativeLayoutController.h
//  BearSkillDemo
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeValueWithBtnView.h"

@interface RelativeLayoutController : UIViewController

//  DashBoard
@property (strong, nonatomic) UIView        *dashBoardView;
@property (strong, nonatomic) UIButton      *upBtn;
@property (strong, nonatomic) UIButton      *downBtn;
@property (strong, nonatomic) UIButton      *leftBtn;
@property (strong, nonatomic) UIButton      *rightBtn;
@property (strong, nonatomic) UIButton      *centerBtn;
@property (strong, nonatomic) UIButton      *parentRelationBtn;
@property (strong, nonatomic) UIButton      *centerRelationBtn;
@property (strong, nonatomic) ChangeValueWithBtnView    *changeValueBtn;

//  Performance
@property (strong, nonatomic) UIView        *viewA;
@property (strong, nonatomic) UIView        *viewB;
@property (assign, nonatomic) BOOL          parentRelation;
@property (assign, nonatomic) BOOL          center;
@property (assign, nonatomic) kDIRECTION    dir;


@end
