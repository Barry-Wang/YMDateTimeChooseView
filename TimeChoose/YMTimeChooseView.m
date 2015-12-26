//
//  TimeChooseView.m
//  TimeChoose
//
//  Created by barryclass on 15/12/25.
//  Copyright © 2015年 barry. All rights reserved.
//

#import "YMTimeChooseView.h"
#import "YMTimeView.h"

#define BaseTag 2222

@interface YMTimeChooseView()
@property (nonatomic, strong) NSMutableArray *isSelectedArray;
@property (nonatomic, assign) CGFloat normalHeight;
@end
@implementation YMTimeChooseView


- (instancetype)initWithFrame:(CGRect)frame dataPickerHeight:(CGFloat)height timeNames:(NSArray *)timeNames {
    
   
    if (self = [super initWithFrame:frame]) {
        
        self.dataPickerHeight = height;
        self.clipsToBounds = YES;
        self.normalHeight = frame.size.height / timeNames.count;
        
        for (int index = 0; index < timeNames.count; index++) {
            
            YMTimeView *timeView = [[YMTimeView alloc] initWithFrame:CGRectMake(0, index *_normalHeight, frame.size.width, _normalHeight) dataPickerHeight:height];
            timeView.nameLabel.text = timeNames[index];
            timeView.tag = BaseTag + index;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(change:)];
            [timeView addGestureRecognizer:tapGesture];
            [self addSubview:timeView];
            [self.timeViewsArray addObject:timeView];
            
        }
    }
    
    return self;
}

- (NSMutableArray *)timeViewsArray {
    
    if (!_timeViewsArray) {
        _timeViewsArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _timeViewsArray;
}

- (NSMutableArray*)isSelectedArray {
    
    if (!_isSelectedArray) {
        
        _isSelectedArray = [[NSMutableArray alloc] initWithCapacity:self.timeViewsArray.count];
        for (int i =0 ; i <self.timeViewsArray.count; i++) {
            [_isSelectedArray addObject:@(NO)];
        }
    }
    return _isSelectedArray;
}

- (void)setDateFormatter:(NSDateFormatter *)dateFormatter {
    
    for (YMTimeView *view in self.timeViewsArray) {
        view.dataFormatter = dateFormatter;
    }
}


- (void)change:(UITapGestureRecognizer *)re {
    
    
    BOOL hasSelected = NO;
    
    for (NSNumber *selected in self.isSelectedArray) {
        hasSelected = hasSelected || [selected boolValue];
    }
    
    YMTimeView *selectedView = (YMTimeView *)re.view;
    NSInteger tapIndex = selectedView.tag - BaseTag;

    [UIView animateWithDuration:0.3 animations:^{
        
        /**
         
         When there is no one is selected or the selected is the pre-one,
         make self's height and the selected timeView's height increased by dataPickerHeight
         and move timeview whose tag is bigger than the selected one down by dataPickerHeight
         
         */
        
        if (hasSelected == NO || [self.isSelectedArray[tapIndex] boolValue] == YES) {
            
            CGFloat offSetHeight = 0;
            
            if (hasSelected == NO) {
                offSetHeight = self.dataPickerHeight;
                self.isSelectedArray[tapIndex] = @YES;

            } else if ([self.isSelectedArray[tapIndex] boolValue]) {
                offSetHeight = -self.dataPickerHeight;
                self.isSelectedArray[tapIndex] = @NO;

            }
            
            for (int i = 0; i < self.timeViewsArray.count; i++) {
                
                YMTimeView *timeView = (YMTimeView *)self.timeViewsArray[i];
                
                if (i == tapIndex) {
                    
                    CGRect rect = timeView.frame;
                    timeView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height + offSetHeight);
                    
                } else if (i > tapIndex) {
                    
                    CGRect rect = timeView.frame;
                    timeView.frame = CGRectMake(rect.origin.x, rect.origin.y + offSetHeight, rect.size.width, rect.size.height);
                }
                
                
            }
            
            CGRect selfRect = self.frame;
            self.frame = CGRectMake(selfRect.origin.x, selfRect.origin.y, selfRect.size.width, selfRect.size.height + offSetHeight);
            
        } else {
            
            
            NSInteger nowSelectedIndex = 0;
            CGFloat nowSelectedHeight = 0;
            CGFloat willSelectedHeight = 0;
            
            for (int i = 0; i <self.isSelectedArray.count; i++) {
                if ([self.isSelectedArray[i] boolValue] == YES) {
                    nowSelectedIndex = i ;
                    break;
                }
            }
            
            for (int i = 0; i < self.timeViewsArray.count; i++) {
                
                YMTimeView *timeView = (YMTimeView *)self.timeViewsArray[i];
                if (i == nowSelectedIndex) {
                    
                    nowSelectedHeight = - self.dataPickerHeight;
                    CGRect rect = timeView.frame;
                    timeView.frame = CGRectMake(rect.origin.x, rect.origin.y + willSelectedHeight, rect.size.width, rect.size.height + nowSelectedHeight);
                } else if (i == tapIndex) {
                    
                    willSelectedHeight = self.dataPickerHeight;
                    CGRect rect = timeView.frame;
                    timeView.frame = CGRectMake(rect.origin.x, rect.origin.y + nowSelectedHeight, rect.size.width, rect.size.height + willSelectedHeight);
                    
                } else {
                    
                    CGRect rect = timeView.frame;
                    timeView.frame = CGRectMake(rect.origin.x, rect.origin.y + nowSelectedHeight + willSelectedHeight, rect.size.width, rect.size.height);
                }
                
            }
            
            self.isSelectedArray[nowSelectedIndex] = @(NO);
            self.isSelectedArray[tapIndex] = @(YES);
        }
    }];
    
}

-(NSString *)getDataStringWithIndex:(NSInteger)index {
   
    YMTimeView *timeView = self.timeViewsArray[index];
    return timeView.timeLabel.text;
}


@end
