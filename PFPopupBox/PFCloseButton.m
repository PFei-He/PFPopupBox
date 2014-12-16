//
//  PFCloseButton.m
//  PFPopupBox
//
//  Created by PFei_He on 14-10-21.
//  Copyright (c) 2014年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/PFPopupBox
//
//  vesion: 0.1.0
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PFCloseButton.h"
#import <QuartzCore/QuartzCore.h>

#define PI 3.14159265358979323846

@implementation PFCloseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//重绘视图
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    //添加画布
    CGContextRef context = UIGraphicsGetCurrentContext();

    //设置画笔颜色
    CGContextSetRGBStrokeColor(context,0,0,0,1.0);

    //设置线的宽度
    CGContextSetLineWidth(context, 1.0);


    /**
     * 画圆
     *
     * p.s.
     * 画圆函数：void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
     * 函数解释：x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
     * 公式和换算：1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
     */

    //添加圆
    CGContextAddArc(context, self.bounds.size.width/2, self.bounds.size.height/2, self.bounds.size.height/2 * 0.95, 0, 2*PI, 1);

    //绘制
    CGContextDrawPath(context, kCGPathStroke);


    /**
     * 画线
     *
     * p.s.
     * 画线函数：void CGContextAddLines(CGContextRef c, const CGPoint points[], size_t count)
     * 函数解释：points[]坐标数组，count大小。
     */

    //添加坐标点
    CGPoint aPoints1[2];

    //起点坐标
    aPoints1[0] = CGPointMake((0.5 - sqrt(2)/4) * self.bounds.size.width, (0.5 - sqrt(2)/4) * self.bounds.size.width);

    //终点坐标
    aPoints1[1] = CGPointMake((0.5 + sqrt(2)/4) * self.bounds.size.width, (0.5 + sqrt(2)/4) * self.bounds.size.width);

    //添加线
    CGContextAddLines(context, aPoints1, 2);

    //绘制
    CGContextDrawPath(context, kCGPathStroke);

    //添加坐标点
    CGPoint aPoints2[2];

    //起点坐标
    aPoints2[0] = CGPointMake((0.5 + sqrt(2)/4) * self.bounds.size.width, (0.5 - sqrt(2)/4) * self.bounds.size.width);

    //终点坐标
    aPoints2[1] = CGPointMake((0.5 - sqrt(2)/4) * self.bounds.size.width, (0.5 + sqrt(2)/4) * self.bounds.size.width);

    //添加线
    CGContextAddLines(context, aPoints2, 2);

    //绘制
    CGContextDrawPath(context, kCGPathStroke);
}

@end
