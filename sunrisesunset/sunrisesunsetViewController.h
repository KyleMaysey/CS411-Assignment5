//
//  sunrisesunsetViewController.h
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/13/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "daylightBarView.h"

@interface sunrisesunsetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *riseTime;
@property (weak, nonatomic) IBOutlet UILabel *setTime;
@property (nonatomic, weak) NSNumber* cLongitude;
@property (nonatomic, weak) NSNumber* cLatitude;
@property (strong, nonatomic) IBOutlet daylightBarView* lightBar;

@end
