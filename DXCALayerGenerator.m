//
//  DXCALayerGenerator.h
//
//  Created by wen on 5/17/17.
//  Copyright © 2017 wen. All rights reserved.
//

#import "DXCALayerGenerator.h"

@implementation DXCALayerGenerator

+ (CAShapeLayer *)ringLayerInRect:(CGRect)rect strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)width{
    CAShapeLayer *ringLayer = [CAShapeLayer layer];
    ringLayer.path = [UIBezierPath bezierPathWithOvalInRect:rect].CGPath;
    ringLayer.strokeColor = strokeColor.CGColor;
    ringLayer.fillColor = [UIColor clearColor].CGColor;
    ringLayer.lineWidth = width;
    
    return ringLayer;
}


+ (CAShapeLayer *)progressRingLayerInRect:(CGRect)rect strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)width progress:(NSUInteger)progress clockwise:(BOOL)clockwise { //NO
    
    CGFloat centerX = rect.size.width/2;
    CGFloat centerY = rect.size.width/2;
    CGPoint centerPoint = CGPointMake(centerX, centerY);
    CGFloat radiusBasic = centerX > centerY ? centerX : centerY;
    
    float persent = 0;
    if (progress > 100) {
        persent = 100;
    }else{
        persent = progress;
    }
    
    UIBezierPath *progressRingPath = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radiusBasic startAngle:M_PI_2 * 3 endAngle:-M_PI_2 * mapNumberToAngleCoefficient(persent) clockwise:NO];
    
    CAShapeLayer *progressRingLayer = [CAShapeLayer layer];
    progressRingLayer.path = progressRingPath.CGPath;
    progressRingLayer.strokeColor = strokeColor.CGColor;
    progressRingLayer.fillColor = [UIColor clearColor].CGColor;
    progressRingLayer.lineWidth = width;
    //uncomment code below for animation
//    progressRingLayer.strokeStart = 0.0f;
//    progressRingLayer.strokeEnd = 0.1f;
    return progressRingLayer;
}

float mapNumberToAngleCoefficient(float number){
    if (number >= 75){
        return (number-75)/25;
    }
    return -3 + number/25;
}

+ (CAShapeLayer *)rectLayer:(CGRect)rect fillColor:(UIColor*)fillColor{
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:rect];
    CAShapeLayer *rectLayer = [CAShapeLayer layer];
    rectLayer.path = rectPath.CGPath;
    rectLayer.fillColor = fillColor.CGColor;
    return rectLayer;
}

+ (CAShapeLayer *)rectLayer:(CGRect)rect fillColor:(UIColor*)fillColor progress:(NSUInteger)progress{
    CGRect progressRect = rect;
    
    float persent = 0;
    if (progress > 100) {
        persent = 100;
    }else{
        persent = progress;
    }
    
    progressRect.size.width = progressRect.size.width*persent/100;
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:progressRect];
    CAShapeLayer *rectLayer = [CAShapeLayer layer];
    rectLayer.path = rectPath.CGPath;
    rectLayer.fillColor = fillColor.CGColor;
    return rectLayer;
}

@end
