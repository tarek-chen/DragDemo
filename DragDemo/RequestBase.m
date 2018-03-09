//
//  RequestBase.m
//  DragDemo
//
//  Created by chen on 2017/6/10.
//  Copyright © 2017年 玩图网络. All rights reserved.
//

#import "RequestBase.h"

@implementation RequestBase

+ (void)requestWithParameterBlock:(SetParameterBlock)PBK {
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionaryWithCapacity:9999];
    PBK(parameter);
//    NSLog(@"参数集：%@", parameter);
}

@end
