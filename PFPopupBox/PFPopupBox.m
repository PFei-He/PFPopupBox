//
//  PFPopupBox.m
//  PFPopupBox
//
//  Created by PFei_He on 14-9-5.
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

#import "PFPopupBox.h"
#import "PFCloseButton.h"

#define kLineColor [UIColor colorWithWhite:0.8 alpha:1.0f]
#define kLineLayerBoardWidth 0.5f

//点击事件
typedef void (^tapBlock)(PFPopupBox *);

@interface PFPopupBox ()
{
    UILabel *titleLabel;
    UIView  *_contentView;
}

///点击事件
@property (nonatomic, copy) tapBlock tapBlock;

@end

@implementation PFPopupBox

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame contentViewWidth:(CGFloat)width contentViewHeight:(CGFloat)height
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.7];
        self.alpha = 1;

        //内容视图
        _contentView = [self loadSubviews:CGRectMake(0, 0, width, height)];
        _contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
        [self addSubview:_contentView];
    }
    return self;
}

#pragma mark - Property Methods

//设置标题的setter方法
- (void)setTitle:(NSString *)title
{
    _title = title;
    titleLabel.text = title;
}

//是否打开用户交互的setter方法
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
    if (userInteractionEnabled) {
        //点击手势
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:recognizer];
    }
}

#pragma mark - Private Methods

//加载子视图
- (UIView *)loadSubviews:(CGRect)frame
{
    if (!_contentView) {

        //标题视图
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.shadowColor = [UIColor blackColor].CGColor;
        view.layer.shadowOffset = CGSizeMake(0, 0);
        view.layer.shadowOpacity = 0.5;
        view.layer.shadowRadius = 2.0;
        view.layer.borderColor =[UIColor clearColor].CGColor;
        view.layer.borderWidth = 1.0;
        view.layer.cornerRadius = 5.0f;

        float MARGIN_TOP = 0.0;
        float MARGIN_LEFT = 10.0;
        float MARGIN_RIGHT = 10.0;
        float CLOSE_WIDTH = 20;

        //标题
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, MARGIN_TOP, frame.size.width - MARGIN_LEFT -MARGIN_RIGHT, 40)];
        titleLabel.backgroundColor =[UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [view addSubview:titleLabel];
        titleLabel.textAlignment = NSTextAlignmentCenter;

        //分割线
        UIView *line = [self drawLine:CGRectMake(CGRectGetMinX(titleLabel.frame), CGRectGetMaxY(titleLabel.frame) - 5, CGRectGetWidth(titleLabel.frame), kLineLayerBoardWidth)];
        [view addSubview:line];

        //关闭按钮
        PFCloseButton *closeButton = [[PFCloseButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) - CLOSE_WIDTH - MARGIN_RIGHT, CGRectGetMinY(titleLabel.frame) + 10, CLOSE_WIDTH, CLOSE_WIDTH)];
        closeButton.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [closeButton addGestureRecognizer:recognizer];
        [view addSubview:closeButton];

        _contentView = view;
    }
    return _contentView;
}

//分割线
- (UIView *)drawLine:(CGRect)frame
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = kLineColor;
    view.frame = frame;
    return view;
}

#pragma mark - Public Methods

//获取弹出框点击事件
- (void)popupBoxDidTappedUsingBlock:(void (^)())block
{
    if (block) self.tapBlock = block, block = nil;
}

//显示
- (void)show
{
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
}

//隐藏
- (void)hide
{
    [self removeFromSuperview];
}

#pragma mark - Events Methods

//弹出框点击事件
- (void)tap:(id)sender
{
    if([self.delegate respondsToSelector:@selector(popupBoxDidTapped)]) {//监听代理并回调
        [self.delegate popupBoxDidTapped];
    } else if (self.tapBlock) {//监听块并回调
        self.tapBlock(self);
    }
}

#pragma mark - Memory Management

- (void)dealloc
{
#if __has_feature(objc_arc)
    self.tapBlock = nil;

    self.delegate = nil;
#else
#endif
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
