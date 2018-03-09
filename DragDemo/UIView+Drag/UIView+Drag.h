//
//  UIView+Drag.h
//  LinLangShow
//
//  Created by chen on 2017/6/10.
//  Copyright © 2017年 玩图网络. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Property.h"

typedef void(^completed) (BOOL state);
@interface UIView (Drag)

sk_property_assign(CGFloat, location_x);
sk_property_assign(CGFloat, location_y);

/// 长按拖动手势
- (void)cat_canDraged:(completed)handle;

@end
