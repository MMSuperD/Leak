//
//  ViewController.m
//  Leak
//
//  Created by sh-lx on 2018/12/5.
//  Copyright © 2018年 sh-lx. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLabel = [UILabel new];
    [self.view addSubview:titleLabel];
    titleLabel.backgroundColor = [UIColor grayColor];
    [titleLabel setTextColor:[UIColor redColor]];
    titleLabel.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 40);
    titleLabel.text = @"点我哦,有惊喜";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self presentViewController:[TestViewController new] animated:YES completion:nil];
}


@end
