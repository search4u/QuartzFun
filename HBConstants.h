//
//  HBConstants.h
//  QuartzFun
//
//  Created by bottle on 15/10/26.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#ifndef QuartzFun_HBConstants_h
#define QuartzFun_HBConstants_h


typedef NS_ENUM(NSInteger, ShapeType)
{
    kLineShape = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
};

typedef NS_ENUM(NSInteger,ColorTabIndex)
{
    kRedColorTab = 0,
    kBlueColorTab,
    kYellowColorTab,
    kGreenColorTab,
    kRandomColorTab
};

#define degreesToRadian(x) (M_PI * (x) / 180.0)

#endif
