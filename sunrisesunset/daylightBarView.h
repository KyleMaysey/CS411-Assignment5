//
//  daylightBarView.h
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/18/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface daylightBarView : UIView
{
    float customRectHeight;
    float customRectWidth;
}

@property int riseHour;     //Property storing hour of sunrise
@property int riseMin;      //Property storing minute of sunrise
@property int setHour;      //Property storing hour of sunset
@property int setMin;       //Property storing minute of sunset

@end
