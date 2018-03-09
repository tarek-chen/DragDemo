//
//  ViewController.m
//  DragDemo
//
//  Created by chen on 2017/6/10.
//  Copyright © 2017年 玩图网络. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Drag.h"
#import "RequestBase.h"
#import "MOTMutablePopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    [view cat_canDraged:^(BOOL state) {
       
        NSLog(@"%d", state);
    }];

}

- (IBAction)MOT:(UIButton *)sender {
    
    MOTPopConfig *config = [MOTPopConfig new];
    config.tabColor = [UIColor orangeColor];
    config.targetView = sender;
    config.size = CGSizeMake(100, 100);
    
    // label
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"卧槽";
    [config addView:label];
    UILabel *label2 = [UILabel new];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:12];
    label2.text = @"卧槽";
    [config addView:label2];
    
    [MOTMutablePopView popWithConfig:config ClickIndexBlock:^(NSUInteger index) {
        NSLog(@"__%ld", index);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
