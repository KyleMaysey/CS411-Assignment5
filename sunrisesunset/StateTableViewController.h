//
//  StateTableViewController.h
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/17/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StateTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray* stateList; //Load list of states

@end
