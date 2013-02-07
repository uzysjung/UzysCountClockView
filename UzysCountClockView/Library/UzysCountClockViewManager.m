//
//  UzysCountClockViewManager.m
//  UzysCountClockView
//
//  Created by Jaehoon Jung on 13. 2. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import "UzysCountClockViewManager.h"
@interface UzysCountClockViewManager()
@property (nonatomic,strong) NSString *currentClock;
@property (nonatomic,strong) NSArray *clockTickers;
@property (nonatomic,assign) NSTimer *tickTimer;

@property (nonatomic,strong) UIView *ViewHour;
@property (nonatomic,strong) UIView *ViewMinute;
@property (nonatomic,strong) UIView *ViewSecond;
@property (nonatomic,strong) UIView *ViewDay;
@property (nonatomic,assign) BOOL is2Digit;
@end

@implementation UzysCountClockViewManager
@synthesize targetDate = _targetDate;

-(id)initWithDayView:(UIView *)dayView HourView:(UIView *)hourView MinuteView:(UIView *)minuteView secondView:(UIView *)secondView option2DigitFix:(BOOL)is2Digit;
{
    self = [super init];
    if(self)
    {
        self.ViewDay = dayView;
        self.ViewHour = hourView;
        self.ViewMinute = minuteView;
        self.ViewSecond = secondView;
        self.clockTickers = [NSArray arrayWithObjects:self.ViewDay,self.ViewHour,self.ViewMinute,self.ViewSecond, nil];
        self.is2Digit = is2Digit;
    }
    return self;
}
-(void)setHidden:(BOOL)hidden
{    
    [self.clockTickers makeObjectsPerformSelector:@selector(setHidden:) withObject:[NSNumber numberWithBool:hidden]];
    if(hidden == NO)
    {
        [self startTimer];
    }
    else
    {
        [self stopTimer];
        self.currentClock = @"00000000"; //day 2 hour 2 minute 2 second 2
    }
}
-(void)dealloc
{
    [self stopTimer];
    [_currentClock release];
    [_clockTickers release];
    [_targetDate release];
    [_ViewDay release];
    [_ViewHour release];
    [_ViewMinute release];
    [_ViewSecond release];
    [super ah_dealloc];
}

#pragma mark - Property
- (void)setTargetDate:(NSDate *)targetDate
{
    if( !targetDate ) return;
    
    [_targetDate release];
    _targetDate = [targetDate ah_retain];
    
    [self numberTick:nil];
    
}
- (NSDate *)targetDate
{
    return _targetDate;
    
}

#pragma mark - Timer
-(void)startTimer
{
    if(!_tickTimer)
        _tickTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(numberTick:) userInfo:nil repeats:YES];
}
-(void)stopTimer
{
    [_tickTimer invalidate];
    self.tickTimer = nil;
}

- (void)numberTick:(id)sender {
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"ddHHmmss"];
    NSUInteger flags =  NSDayCalendarUnit |NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents* dateComponents = [[NSCalendar currentCalendar] components: flags fromDate: [NSDate date] toDate: _targetDate options: 0];
    
    NSString *newClock = [NSString stringWithFormat:@"%.2d%.2d%.2d%.2d",[dateComponents day],
                          [dateComponents hour],
                          [dateComponents minute],
                          [dateComponents second] ];
    NSLog(@"curDate %@ , targetDate %@",[NSDate date] ,_targetDate );
    NSLog(@"Clock :%@ day %d h %d m %d s %d",newClock,[dateComponents day],[dateComponents hour],[dateComponents minute],      [dateComponents second]);
    [_clockTickers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if (![[_currentClock substringWithRange:NSMakeRange(idx*2, 2)] isEqualToString:[newClock substringWithRange:NSMakeRange(idx*2, 2)]])
        {
            
            [UIView transitionWithView:obj duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                
                if([obj isKindOfClass:[UILabel class]])
                {
                    UILabel *label = obj;
                    if(self.is2Digit)
                        label.text = [newClock substringWithRange:NSMakeRange(idx*2, 2)];
                    else
                        label.text = [NSString stringWithFormat:@"%d",[[newClock substringWithRange:NSMakeRange(idx*2, 2)] integerValue]];
                }
                
            } completion:nil];
        }
    }];
    self.currentClock = newClock;
}

@end
