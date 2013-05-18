//
//  CitiesTableViewController.h
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/17/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitiesTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString* stateAbv;
@property (strong, nonatomic) NSArray* cityInfoList;

@end
