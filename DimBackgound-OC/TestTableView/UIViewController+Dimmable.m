//
//  UIViewController+Dimmable.m
//  TestTableView
//
//  Created by mokong on 16/6/1.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import "UIViewController+Dimmable.h"

@implementation UIViewController (Dimmable)

- (void)dimWithDimDirection:(MKDimDirection)dimDirection
                      color:(UIColor *)dimColor
                      alpha:(CGFloat)dimAlpha
                      speed:(CGFloat)dimDuration
{
    switch (dimDirection) {
        case MKDimDirectionIn:
        {
            // create and add a dimView
            UIView *dimView = [[UIView alloc] initWithFrame:self.view.frame];
            dimView.backgroundColor = dimColor;
            dimView.alpha = 0.0;
            [self.view addSubview:dimView];
            
            // deal with autolayout
            dimView.translatesAutoresizingMaskIntoConstraints = NO;
            [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[dimView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:@{@"dimView": dimView}]];
            [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[dimView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:@{@"dimView": dimView}]];
            
            // animate alpha (the actural "dimming" effect)
            [UIView animateWithDuration:dimDuration animations:^{
                dimView.alpha = dimAlpha;
            }];
        }
            break;
        case MKDimDirectionOut:
        {
            UIView *dimView = [self.view.subviews lastObject];
            [UIView animateWithDuration:dimDuration animations:^{
                if (dimView.alpha == dimAlpha) {
                    dimView.alpha = 0;
                }
            } completion:^(BOOL finished) {
                [dimView removeFromSuperview];
            }];
        }
            break;
        default:
            break;
    }
}

@end
