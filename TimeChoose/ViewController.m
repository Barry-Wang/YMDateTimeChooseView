//
//  ViewController.m
//  TimeChoose
//
//  Created by barryclass on 15/12/25.
//  Copyright © 2015年 barry. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (nonatomic, strong) YMTimeChooseView *timeView;
@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.timeView = [[YMTimeChooseView alloc] initWithFrame:CGRectMake(40, 150, 320, 300) dataPickerHeight:150 timeNames:@[@"开始时间",@"中间时间",@"结束时间",@"开始时间",@"中间时间",@"结束时间"]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyy-MM";
    
    self.timeView.dateFormatter = formatter;
    

   [self.view addSubview:self.timeView];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)click:(id)sender {
    
    CGRect rect = self.timeView.frame;
    rect.size.height = 300;
    [UIView animateWithDuration:0.5 animations:^{
        self.timeView.frame = rect;
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
