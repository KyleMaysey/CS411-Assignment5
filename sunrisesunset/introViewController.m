//
//  introViewController.m
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/17/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "introViewController.h"
#import "sunrisesunsetViewController.h"


@interface introViewController ()

@end

@implementation introViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.devLocation = [[CLLocationManager alloc] init];
    self.devLocation.delegate = self;
    
    [self.devLocation startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* currLocation = [locations lastObject];
    self.currLong = currLocation.coordinate.longitude;
    self.currLat = currLocation.coordinate.latitude;
    
    [self.devLocation stopUpdatingLocation];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"currSegue"])
    {
        sunrisesunsetViewController* sunView = segue.destinationViewController;
        
        //NSIndexPath* selectedIndex = [self.tableView indexPathForSelectedRow];
        
        //NSArray* cData = [self.cityInfoList objectAtIndex:selectedIndex.row];
        
        sunView.cLongitude = [NSNumber numberWithDouble:self.currLong];
        sunView.cLatitude = [NSNumber numberWithDouble:self.currLat];
    }
}

@end
