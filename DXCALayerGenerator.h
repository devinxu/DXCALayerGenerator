//
//  DXCALayerGenerator.h
//
//  Created by wen on 5/17/17.
//  Copyright © 2017 wen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface DXCALayerGenerator : CALayer

+ (CAShapeLayer *)ringLayerInRect:(CGRect)rect strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)width;

//progress from 0-100
+ (CAShapeLayer *)progressRingLayerInRect:(CGRect)rect strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)width progress:(NSUInteger)progress clockwise:(BOOL)clockwise;

+ (CAShapeLayer *)rectLayer:(CGRect)rect fillColor:(UIColor*)fillColor;
+ (CAShapeLayer *)rectLayer:(CGRect)rect fillColor:(UIColor*)fillColor progress:(NSUInteger)progress;

@end
