//
//  PFPopupBox.h
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

#import <UIKit/UIKit.h>

@class PFPopupBox;

@protocol PFPopupBoxDelegate <NSObject>

/**
 *  @brief 点击弹出框
 *  @details 使用前必须先打开用户交互功能（***.userInteractionEnabled = YES;）
 */
- (void)popupBoxDidTapped;

@end

@interface PFPopupBox : UIView

///标题
@property (nonatomic, copy)             NSString                *title;

///内容视图
@property (nonatomic, strong, readonly) UIView                  *contentView;

///代理
@property (nonatomic, weak)             id<PFPopupBoxDelegate>  delegate;

/**
 *  @brief 初始化内容视图
 *  @param 内容视图宽度
 *  @param 内容视图高度
 */
- (id)initWithFrame:(CGRect)frame contentViewWidth:(CGFloat)width contentViewHeight:(CGFloat)height;

/**
 *  @brief 显示弹出框
 */
- (void)show;

/**
 *  @brief 隐藏弹出框
 */
- (void)hide;

/**
 *  @brief 点击弹出框
 *  @details 使用前必须先打开用户交互功能（.userInteractionEnabled = YES;）
 */
- (void)popupBoxDidTappedUsingBlock:(void (^)())block;

@end
