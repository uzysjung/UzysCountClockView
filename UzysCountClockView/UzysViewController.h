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
#import "ARCHelper.h"
@interface UzysViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnStart;
@property (strong, nonatomic) IBOutlet SSLabel *label_Day;
@property (strong, nonatomic) IBOutlet SSLabel *label_Hour;
@property (strong, nonatomic) IBOutlet SSLabel *label_Minute;
@property (strong, nonatomic) IBOutlet SSLabel *label_Seconds;
@property (strong, nonatomic) UzysCountClockViewManager *cntClockViewManager;
@property (strong, nonatomic) IBOutlet UIView *viewSecBG;
- (IBAction)actionStart:(id)sender;

@end
