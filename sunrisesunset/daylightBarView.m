//
//  daylightBarView.m
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/18/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "daylightBarView.h"

@implementation daylightBarView

#define MIN_IN_HOUR 60.0
#define HOUR_IN_DAY 24.0

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


//Purpose:  Initilize when view is read from archive
//Input:    None
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        customRectHeight = 100.0;   //Set drawn rect height
        customRectWidth = 280.0;    //Set drawn rect width
    }
    
    return self;
}

//Purpose:  Draw function when view is told to refresh
//Input:    None
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();   //Get graphics context
    
    // And drawing with a red fill color
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);  //Set red fill color for first bar
    
    double predawnHours = (((double) self.riseMin) / MIN_IN_HOUR) + ((double) self.riseHour);
    
    double risePortion =  predawnHours / HOUR_IN_DAY;
    
    risePortion = risePortion * customRectWidth;
    
    CGContextFillRect(context, CGRectMake(0.0, 0.0, risePortion, customRectHeight));
    
    double daylightHours = (((double) self.setMin) / MIN_IN_HOUR) + ((double) self.setHour);
    
    double daylightPortion = (daylightHours - predawnHours) / HOUR_IN_DAY;
    
    daylightPortion = daylightPortion * customRectWidth;
    
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    
    CGContextFillRect(context, CGRectMake(risePortion, 0.0, daylightPortion, customRectHeight));    //Draw red daylight bar
    
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    
    CGContextFillRect(context, CGRectMake(risePortion + daylightPortion, 0.0,(customRectWidth - daylightPortion - risePortion), customRectHeight));  //Draw final blue nighttime bar
                      
                      
                      
                      
}
@end
