//
//  BJView.m
//  Quartz2D
//
//  Created by bradleyjohnson on 2016/11/21.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#define arc(angle) ((angle)*(M_PI/180.0))

#import "BJView.h"

@implementation BJView

-(void)setType:(DrawType)type
{
    _type = type;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    switch (self.type) {
        case DrawTypeLine:
        {
            [self drawLine:rect];
        }
            break;
        case DrawTypeBrokenLine:
        {
            [self drawBrokenLine:rect];
        }
            break;
        case DrawTypeRect:
        {
            [self drawRectBJ:rect];
        }
            break;
        case DrawTypeRound:
        {
            [self drawRount:rect];
        }
            break;
        case DrawTypeCircularArc:
        {
            [self drawCircularArc:rect];
        }
            break;
        case DrawTypeString:
        {
            [self drawString:rect];
        }
            break;
        case DrawTypeImage:
        {
            [self drawImage:rect];
        }
            break;
        default:
        {
            [self drawLine:rect];
        }
            break;
    }
}

-(void)drawLine:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextMoveToPoint(context, 1.0, rect.size.height/2.0);
    
    CGContextAddLineToPoint(context, rect.size.width-2.0, rect.size.height/2.0);
    
    CGContextDrawPath(context, kCGPathStroke);
}


-(void)drawBrokenLine:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextMoveToPoint(context, 1.0, rect.size.height-1.0);
    
    CGContextAddLineToPoint(context, (rect.size.width-2.0)/2.0, 1.0);
    
    CGContextAddLineToPoint(context, rect.size.width-2.0, rect.size.height-1.0);
    
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathStroke);
}

-(void)drawRectBJ:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextAddRect(context, CGRectMake(1.0, 1.0, rect.size.width-2.0, rect.size.height-2.0));
    
    CGContextDrawPath(context, kCGPathStroke);
}

-(void)drawRount:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextAddEllipseInRect(context, CGRectMake(1.0, 1.0, rect.size.width-2.0, rect.size.height-2.0));
    
    CGContextDrawPath(context, kCGPathStroke);
}

-(void)drawCircularArc:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextAddArc(context, rect.size.width/2.0, rect.size.height/2.0, (rect.size.width-2.0)/2.0, arc(180), arc(360), 0);
    
    CGContextDrawPath(context, kCGPathStroke);
}

-(void)drawString:(CGRect)rect
{
    NSString * name = @"Bradley Johnson";
    
    NSMutableDictionary * attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attributes[NSForegroundColorAttributeName] = [UIColor purpleColor];
    attributes[NSBackgroundColorAttributeName] = [UIColor whiteColor];
    [name drawInRect:CGRectMake(1.0, 100, rect.size.width, 50.0) withAttributes:attributes];
}

-(void)drawImage:(CGRect)rect
{
    UIImage * img = [UIImage imageNamed:@"bradleyJohnson.jpg"];
    
    // 在指定的范围内绘制图片，有可能引起图片拉伸
    [img drawInRect:rect];
}
@end
