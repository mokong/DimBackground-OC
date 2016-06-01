//
//  SecondViewController.h
//  TestTableView
//
//  Created by mokong on 16/6/1.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CloseCallback)(void);

@interface SecondViewController : UIViewController

@property (nonatomic, copy) CloseCallback closeCallback;

@end
