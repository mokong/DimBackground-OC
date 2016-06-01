//
//  UIViewController+Dimmable.h
//  TestTableView
//
//  Created by mokong on 16/6/1.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKDimDirection) {
    MKDimDirectionIn, // show
    MKDimDirectionOut // hide
};
@interface UIViewController (Dimmable)

/**
 *  dim show or hide
 *
 *  @param dimDirection dim direction, in equals show, out equals hide
 *  @param dimColor     dim color
 *  @param dimAlpha     dim alpha
 *  @param dimDuration  dim duration
 */
- (void)dimWithDimDirection:(MKDimDirection)dimDirection
                      color:(UIColor *)dimColor
                      alpha:(CGFloat)dimAlpha
                      speed:(CGFloat)dimDuration;

@end
