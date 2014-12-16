//
//  RootVC.m
//  Demo
//
//  Created by PFei_He on 14-12-16.
//  Copyright (c) 2014年 PF-Lib. All rights reserved.
//

#import "RootVC.h"
#import "PFPopupBox.h"

@interface RootVC ()

@end

@implementation RootVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Views Management

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(110, 100, 100, 30);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - Events Management

- (void)tap:(UIButton *)button
{
    PFPopupBox *popupBox = [[PFPopupBox alloc] initWithFrame:[UIScreen mainScreen].bounds contentViewWidth:280 contentViewHeight:300];
    popupBox.title = @"弹出框测试";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, popupBox.contentView.frame.size.width - 20, 30)];
    label.text = @"测试";
    [popupBox.contentView addSubview:label];
    [popupBox show];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
