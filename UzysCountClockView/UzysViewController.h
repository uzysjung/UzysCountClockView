//
//  UzysViewController.h
//  UzysCountClockView
//
//  Created by Jaehoon Jung on 13. 2. 4..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSLabel.h"
#import "UzysCountClockViewManager.h"

@interface UzysViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *btnStart;
@property (retain, nonatomic) IBOutlet SSLabel *label_Day;
@property (retain, nonatomic) IBOutlet SSLabel *label_Hour;
@property (retain, nonatomic) IBOutlet SSLabel *label_Minute;
@property (retain, nonatomic) IBOutlet SSLabel *label_Seconds;
@property (retain, nonatomic) UzysCountClockViewManager *cntClockViewManager;
@property (retain, nonatomic) IBOutlet UIView *viewSecBG;
- (IBAction)actionStart:(id)sender;

@end
