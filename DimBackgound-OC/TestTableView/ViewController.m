//
//  ViewController.m
//  TestTableView
//
//  Created by mokong on 16/3/16.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "UIViewController+Dimmable.h"

@interface ViewController ()
{
    UIColor *dimColor;
    CGFloat dimAlpha;
    CGFloat dimSpeed;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dimColor = [UIColor blackColor];
    dimAlpha = 0.7;
    dimSpeed = 0.5;
}

- (IBAction)present:(id)sender {
    [self dimWithDimDirection:MKDimDirectionIn color:dimColor alpha:dimAlpha speed:dimSpeed];
    
    __weak typeof(self) weakSelf = self;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *secondVC = (SecondViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    secondVC.closeCallback = ^(){
        [weakSelf dimWithDimDirection:MKDimDirectionOut color:dimColor alpha:dimAlpha speed:dimSpeed];
    };
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
