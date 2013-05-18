//
//  CitiesDatabase.m
//  sunrisesunset
//
//  Created by Kyle Maysey on 5/17/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "CitiesDatabase.h"

@implementation CitiesDatabase

static CitiesDatabase* cDatabase;   //Persistent reference for MetroDatabase object


//Purpose: Acquire database, instantiating if needed
+(CitiesDatabase *) getDatabase
{
    if (cDatabase == nil)
    {
        cDatabase = [[CitiesDatabase alloc] init];
    }
    return cDatabase;
}

-(id) init
{
    self = [super init];
    
    if(self)
    {
        NSString* mDatPath = [[NSBundle mainBundle] pathForResource:@"us_cities_with_timezones" ofType:@"sl3"];
        
        if( sqlite3_open([mDatPath UTF8String], &citiesConnect) != SQLITE_OK)
        {
            NSLog(@"Failed to open SQL Database");
        }
        
    }
    
    return self;
}

- (void) dealloc
{
    sqlite3_close(citiesConnect);
}

//Purpose:  Performs query to get ordered list of states in database
//Return:   NSArray of NSStrings
- (NSArray*) getStates
{
    
    NSMutableArray* stateListReturn = [[NSMutableArray alloc] init];
    NSString* query = @"select state from (select distinct state from cities) order by state;";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *routeName;
    
    if( sqlite3_prepare_v2(citiesConnect, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        
        while( sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            if( text )
                routeName = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeName = nil;
            
            [stateListReturn addObject: routeName];
        }
        sqlite3_finalize(stmt);
    }
    
    return stateListReturn;
}

-(NSArray *) getCitiesFromState:(NSString *)stateAbv
{
    NSMutableArray* cityListReturn = [[NSMutableArray alloc] init];
    
    NSString* query = [NSString stringWithFormat:@"select name, longitude, latitude from cities where state=\"%@\" order by name;", stateAbv];
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *cityName;
    NSNumber *cLongitude, *cLatitude;
    
    if( sqlite3_prepare_v2(citiesConnect, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if(text)
            {
                cityName = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            }
            else
            {
                cityName= nil;
            }
            cLongitude = [NSNumber numberWithDouble:(sqlite3_column_double(stmt, 1))];
            cLatitude = [NSNumber numberWithDouble:(sqlite3_column_double(stmt, 2))];
            
            NSArray* cityInfo = @[cityName, cLongitude, cLatitude];
            
            [cityListReturn addObject: cityInfo];
        }
        sqlite3_finalize(stmt);
    }
    return cityListReturn;
}


@end
