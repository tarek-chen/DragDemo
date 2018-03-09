//
//  UIView+Drag.m
//  LinLangShow
//
//  Created by chen on 2017/6/10.
//  Copyright © 2017年 玩图网络. All rights reserved.
//

#import "UIView+Drag.h"

@implementation UIView (Drag)

sk_def_property_assign(CGFloat, location_x)
sk_def_property_assign(CGFloat, location_y)
#pragma mark - property

static completed dragEnd = nil;
- (void)cat_canDraged:(completed)handle {

    // 长按拖动
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(action_move:)];
    longPress.minimumPressDuration = 0.3; //定义按的时间
    longPress.numberOfTouchesRequired = 1;
    dragEnd = [handle copy];
    [self addGestureRecognizer:longPress];
}

#pragma mark -- 长按拖动
CGFloat duration = .2f;

- (void)action_move:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        CGPoint startLocation = [sender locationInView: self.superview];
        self.location_x = startLocation.x - self.center.x;
        self.location_y = startLocation.y - self.center.y;
        // 保存x、y差值
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:duration animations:^{
                
                self.transform = CGAffineTransformMakeScale(1.1, 1.1);
                self.alpha = 0.7;
                self.layer.borderWidth = 3;
                self.layer.borderColor = [UIColor colorWithRed:231 green:231 blue:231 alpha:0.8].CGColor;
            }];
        });
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        CGPoint pt = [sender locationInView:self.superview];
        CGFloat center_x = pt.x - self.location_x;
        CGFloat center_y = pt.y - self.location_y;
        CGPoint newcenter = CGPointMake(center_x, center_y);
        // Set new location
        self.center = newcenter;
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if (dragEnd) dragEnd(YES);
        // 结束后恢复缩放、透明边线等样式
        [self acttion_endDrag];
    }
}

#pragma mark -- 结束拖动恢复样式
- (void)acttion_endDrag {
    // 恢复缩放
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:duration animations:^{
            self.transform = CGAffineTransformIdentity;
            self.alpha = 1.0;
            self.layer.borderWidth = 0;
            self.layer.borderColor = [UIColor clearColor].CGColor;
        }];
    });
}

@end
