//
//  UzysViewController.m
//  UzysCountClockView
//
//  Created by Jaehoon Jung on 13. 2. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import "UzysViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface UzysViewController ()

@end

@implementation UzysViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.cntClockViewManager = [[UzysCountClockViewManager alloc] initWithDayView:_label_Day HourView:_label_Hour MinuteView:_label_Minute secondView:_label_Seconds option2DigitFix:YES];
    
    [self.cntClockViewManager setTargetDate:[NSDate dateWithTimeIntervalSinceNow:100000]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_btnStart release];
    [_label_Day release];
    [_label_Hour release];
    [_label_Minute release];
    [_label_Seconds release];

    [super dealloc];
}
- (IBAction)actionStart:(id)sender {
    
    static BOOL isOn = YES;
    UIButton *btn = (UIButton *)sender;
    
    if(isOn)
    {
        [btn setTitle:@"Stop" forState:UIControlStateNormal];
        [self.cntClockViewManager startTimer];
    }
    else
    {
        [btn setTitle:@"Start" forState:UIControlStateNormal];
        [self.cntClockViewManager stopTimer];
    }
    isOn = !isOn;

}
@end
