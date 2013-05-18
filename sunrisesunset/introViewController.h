//
//  introViewController.h
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/17/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface introViewController : UIViewController <CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager* devLocation;
@property double currLong;
@property double currLat;

@end
