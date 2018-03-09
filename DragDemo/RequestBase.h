//
//  RequestBase.h
//  DragDemo
//
//  Created by chen on 2017/6/10.
//  Copyright © 2017年 玩图网络. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SetParameterBlock)(NSMutableDictionary *parameter);
@interface RequestBase : NSObject

+ (void)requestWithParameterBlock:(SetParameterBlock)PBK;

@end
