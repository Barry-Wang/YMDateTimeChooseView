//
//  TimeView.h
//  TimeChoose
//
//  Created by barryclass on 15/12/25.
//  Copyright © 2015年 barry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMTimeView : UIView
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIDatePicker *dataPicker;
@property (nonatomic, assign) float animationTime;
@property (nonatomic, strong) NSDateFormatter *dataFormatter;
- (instancetype) initWithFrame:(CGRect)frame dataPickerHeight:(CGFloat)height;


@end
