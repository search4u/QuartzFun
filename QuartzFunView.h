//
//  QuartzFunView.h
//  QuartzFun
//
//  Created by bottle on 15/10/26.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBConstants.h"

@interface QuartzFunView : UIView

@property (nonatomic,assign) CGPoint  firstTouchLocation;
@property (nonatomic,assign) CGPoint  lastTouchLocation;
@property (nonatomic,assign) ShapeType  shareType;
@property (nonatomic,assign) BOOL  useRandomColor;
@property (nonatomic,strong) UIColor *currentColor;
@property (nonatomic,strong) UIImage *drawImage;

@property (nonatomic,readonly)CGRect currentRect;
@property (nonatomic,assign) CGRect  redrawRect;

@end
