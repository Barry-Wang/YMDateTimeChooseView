//
//  TimeView.m
//  TimeChoose
//
//  Created by barryclass on 15/12/25.
//  Copyright © 2015年 barry. All rights reserved.
//

#import "YMTimeView.h"

@interface YMTimeView()<UIPickerViewDelegate>
@property (nonatomic, strong) UIView *line;
@end

@implementation YMTimeView

- (instancetype) initWithFrame:(CGRect)frame dataPickerHeight:(CGFloat)height
{
    if (self = [super initWithFrame:frame]) {
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, frame.size.height - 20)];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        self.dataFormatter = formatter;
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, frame.size.width - 150, frame.size.height -20)];
        timeLabel.text = [formatter stringFromDate:[NSDate date]];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(nameLabel.frame) + 5, frame.size.width, height)];
        picker.datePickerMode = UIDatePickerModeDate;
        [self addSubview:picker];
        self.dataPicker = picker;
        [picker addTarget:self action:@selector(upDateTime:) forControlEvents:UIControlEventValueChanged];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 1 / [UIScreen mainScreen].scale, self.frame.size.width, 1 / [UIScreen mainScreen].scale)];
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
        self.line = line;
        
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.animationTime = 0.3;
    }

    
    return self;
}

- (void)setDataFormatter:(NSDateFormatter *)dataFormatter {
    
    _dataFormatter = dataFormatter;
    self.timeLabel.text =[_dataFormatter stringFromDate:[NSDate date]];
}

- (void)layoutSubviews {
  
    [super layoutSubviews];
    [UIView animateWithDuration:self.animationTime animations:^{
        self.line.frame = CGRectMake(0, self.frame.size.height - 1 / [UIScreen mainScreen].scale, self.frame.size.width, 1 / [UIScreen mainScreen].scale);
    }];
    
}

- (void)upDateTime:(UIDatePicker *)dataPicker {
    
    self.timeLabel.text = [self.dataFormatter stringFromDate:dataPicker.date];

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
