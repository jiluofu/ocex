//
//  mmEx1ViewController.m
//  ocex
//
//  Created by zhuxu on 2018/7/2.
//  Copyright © 2018年 zhuxu. All rights reserved.
//

#import "mmEx1ViewController.h"
#import "mmEx2ViewController.h"

@interface mmEx1ViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation mmEx1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"FristVC";
    
    
    self.button = [UIButton new];
    self.button.frame = CGRectMake(10, 50, 100, 100);
    self.button.center = self.view.center;
    self.button.layer.borderColor = [UIColor blackColor].CGColor;
    self.button.layer.borderWidth = 1.0f;
    [self.button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    
    [self showAllTextDialog:@"开始啦"];
}

- (void)showAllTextDialog:(NSString *)str
{
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = str;
    
    
    //hud.bezelView.style = MBProgressHUDBackgroundStyleSolidCo;
    hud.label.font = [UIFont systemFontOfSize:17.0];
    hud.userInteractionEnabled = NO;
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
    
}

#pragma mark - 按钮点击事件

-  (void)button:(UIButton *)button{
    
    mmEx2ViewController *vc = [[mmEx2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
