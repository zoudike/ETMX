//
//  ViewController.m
//  ETMX
//
//  Created by 杨香港 on 2016/10/30.
//  Copyright © 2016年 杨香港. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Test *netWorkingTest = [[Test alloc] init];
    [netWorkingTest soapRequestTest];
    
    
    UILabel * titleLabel = [[UILabel alloc] init];
    [titleLabel setText:@"欢迎使用 ETMX"];
    [titleLabel setFont:[UIFont systemFontOfSize:60]];
    [titleLabel setFrame:CGRectMake(0, 0, 100, 30)];
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:titleLabel];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100]];

}


@end
