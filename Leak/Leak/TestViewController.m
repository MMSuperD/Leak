//
//  TestViewController.m
//  Leak
//
//  Created by sh-lx on 2018/12/5.
//  Copyright © 2018年 sh-lx. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)void(^block)(void);

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor brownColor];
    
    self.block = ^{
        self.index = 5;
    };
    
    UILabel *titleLabel = [UILabel new];
    [self.view addSubview:titleLabel];
    titleLabel.backgroundColor = [UIColor greenColor];
    [titleLabel setTextColor:[UIColor redColor]];
    titleLabel.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 40);
    titleLabel.text = @"点我哦,消失哦,可能存在内存泄漏哦";
    titleLabel.textAlignment = NSTextAlignmentCenter;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
