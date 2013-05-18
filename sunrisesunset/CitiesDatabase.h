//
//  CitiesDatabase.h
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/17/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface CitiesDatabase : NSObject
{
    sqlite3* citiesConnect;  //For opening cities database
}

//Purpose: Acquire database, instantiating if needed
+ (CitiesDatabase *) getDatabase;

//Purpose:  Performs query to get ordered list of states in database
//Return:   NSArray of NSStrings
-(NSArray *) getStates;

//Purpose:  Performs query to get acquire list of all cities
//Return:   NSArray of city information in an NSArray.
//          Row data take the form: [City name, longitude, latitude]
- (NSArray*) getCitiesFromState: (NSString*) stateAbv;

@end
