//
//  UzysCountClockViewManager.h
//  UzysCountClockView
//
//  Created by Jaehoon Jung on 13. 2. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UzysCountClockViewManager : NSObject

@property (strong) NSDate *targetDate;

- (void)startTimer;
- (void)stopTimer;
- (void)setHidden:(BOOL)hidden;
-(id)initWithDayView:(UIView *)dayView HourView:(UIView *)hourView MinuteView:(UIView *)minuteView secondView:(UIView *)secondView option2DigitFix:(BOOL)is2Digit;
@end
