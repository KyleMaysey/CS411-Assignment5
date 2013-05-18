//
//  sunrisesunsetViewController.m
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/13/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "sunrisesunsetViewController.h"

#include <libnova/solar.h>
#include <libnova/julian_day.h>
#include <libnova/rise_set.h>
#include <libnova/transform.h>
#include <libnova/utility.h>
#include <libnova/refraction.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static struct ln_lnlat_posn observer;
static double JD;
static struct ln_helio_posn pos;
static struct ln_equ_posn equ;

@interface sunrisesunsetViewController ()

@end

@implementation sunrisesunsetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    observer.lat = [self.cLatitude doubleValue];
    observer.lng = [self.cLongitude doubleValue];
    JD = ln_get_julian_from_sys();
    ln_get_solar_geom_coords(JD, &pos);
    ln_get_solar_equ_coords(JD, &equ);
    
    struct ln_rst_time rst;
    struct ln_zonedate rise, set, transit;

    if( ln_get_solar_rst_horizon(JD, &observer, LN_SOLAR_STANDART_HORIZON, &rst) == 1 )
    {
        NSLog(@"Sun is circumpolar\n");
    }
    else
    {
        ln_get_local_date(rst.rise, &rise);
        ln_get_local_date(rst.transit, &transit);
        ln_get_local_date(rst.set, &set);
        
        self.riseTime.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d\n", rise.hours, rise.minutes, (int) round(rise.seconds)];
        
        self.setTime.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d\n", set.hours, set.minutes, (int) round(set.seconds)];
        
    }
    
    self.lightBar.riseHour = rise.hours;
    self.lightBar.riseMin = rise.minutes;
    self.lightBar.setHour = set.hours;
    self.lightBar.setMin = set.minutes;
    
    [self.lightBar setNeedsDisplay];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
