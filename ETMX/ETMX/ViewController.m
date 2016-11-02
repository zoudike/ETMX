//
//  ViewController.m
//  ETMX
//
//  Created by 杨香港 on 2016/10/30.
//  Copyright © 2016年 杨香港. All rights reserved.
//

#import "ViewController.h"
#import "ETMXApi.h"
#import "ETMXDefine.h"


@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *LanguagePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    UILabel * titleLabel = [[UILabel alloc] init];
    [titleLabel setText:@"欢迎使用 ETMX"];
    [titleLabel setFont:[UIFont systemFontOfSize:60]];
    [titleLabel setFrame:CGRectMake(0, 0, 100, 30)];
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:titleLabel];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100]];

    self.LanguagePicker.delegate = self;
    self.LanguagePicker.dataSource = self;
    
}



#pragma UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{    
    return 2;
}
#pragma UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 400;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 35;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        return @"中文简体";
    }else if (row == 1){
        return @"中文繁体";
    }
    return nil;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    ETMXApi * eTMXApi = [[ETMXApi alloc] init];
    if (row == 0) {
        eTMXApi.language = @"中文简体";
    }else if (row == 1){
        eTMXApi.language = @"中文繁体";
        
    }
    
    
    
}





@end
