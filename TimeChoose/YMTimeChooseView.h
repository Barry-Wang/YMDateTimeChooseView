//
//  TimeChooseView.h
//  TimeChoose
//
//  Created by barryclass on 15/12/25.
//  Copyright © 2015年 barry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMTimeChooseView : UIView

// The height of datePickerView
@property (nonatomic, assign) CGFloat dataPickerHeight;

//The array that save the show TimeViews
@property (nonatomic, strong) NSMutableArray *timeViewsArray;

// The TimeView's timeLabel use this formatter to format the  data text
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

/**
 
 @desc:                 create a TimeChooseView,this is a init method
 
 @param frame           this view's frame
 
 @param height          the showed datePicker view's height
 
 @param timeNames       the names for show TimeViews, the count of timeNames decide the count of TimesView and the TimeView's height equal
                        to frame's height Divide the count of timeNames.
 
 */

- (instancetype)initWithFrame:(CGRect)frame dataPickerHeight:(CGFloat)height timeNames:(NSArray *)timeNames;

/**
 
 @desc:    get the timeView's time string at index
 
 @param:   the timeview's index at timeViewsArray
 
 */
-(NSString *)getDataStringWithIndex:(NSInteger)index;
@end
