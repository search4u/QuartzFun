//
//  QuartzFunView.m
//  QuartzFun
//
//  Created by bottle on 15/10/26.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "QuartzFunView.h"
#import "UIColor+Random.h"

@implementation QuartzFunView


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"iphone.png"];
    }
    return self;
}

- (CGRect)currentRect
{
    return CGRectMake(self.firstTouchLocation.x,
                      self.firstTouchLocation.y,
                      self.lastTouchLocation.x - self.firstTouchLocation.x,
                      self.lastTouchLocation.y - self.firstTouchLocation.y);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.useRandomColor) {
        self.currentColor = [UIColor randomColor];
    }
    UITouch *touch = [touches anyObject];
    self.firstTouchLocation = [touch locationInView:self];
    self.lastTouchLocation = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInView:self];
    
    if (self.shareType == kImageShape) {
        CGFloat hOffset = self.drawImage.size.width / 2;
        CGFloat vOffset = self.drawImage.size.height / 2;
        self.redrawRect = CGRectUnion(self.redrawRect, CGRectMake(self.lastTouchLocation.x - hOffset,
                                                                  self.lastTouchLocation.y - vOffset,
                                                                  self.drawImage.size.width,
                                                                  self.drawImage.size.height));
    }else{
        self.redrawRect = CGRectUnion(self.redrawRect, self.currentRect);
    }
    
    self.redrawRect = CGRectInset(self.redrawRect, -2.0, -2.0);
    
    [self setNeedsDisplayInRect:self.redrawRect];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInView:self];
    
    if (self.shareType == kImageShape) {
        CGFloat hOffset = self.drawImage.size.width / 2;
        CGFloat vOffset = self.drawImage.size.height / 2;
        self.redrawRect = CGRectUnion(self.redrawRect, CGRectMake(self.lastTouchLocation.x - hOffset,
                                                                  self.lastTouchLocation.y - vOffset,
                                                                  self.drawImage.size.width,
                                                                  self.drawImage.size.height));
    }
    self.redrawRect = CGRectUnion(self.redrawRect, self.currentRect);
    
    [self setNeedsDisplayInRect:self.redrawRect];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, self.currentColor.CGColor);
    
    CGContextSetFillColorWithColor(context, self.currentColor.CGColor);
//    CGRect currentRect = CGRectMake(self.firstTouchLocation.x,
//                                    self.firstTouchLocation.y,
//                                    self.lastTouchLocation.x - self.firstTouchLocation.x,
//                                    self.lastTouchLocation.y - self.firstTouchLocation.y);
    
    switch (self.shareType) {
        case kLineShape:
            CGContextMoveToPoint(context, self.firstTouchLocation.x, self.firstTouchLocation.y);
            CGContextAddLineToPoint(context, self.lastTouchLocation.x, self.lastTouchLocation.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathStroke);
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape:
        {
            CGFloat hOffset = self.drawImage.size.width / 2;
            CGFloat vOffset = self.drawImage.size.height / 2;
            CGPoint drawPt = CGPointMake(self.lastTouchLocation.x - hOffset, self.lastTouchLocation.y - vOffset);
            [self.drawImage drawAtPoint:drawPt];
            break;
        }
        default:
            break;
    }
}
@end
