//
//  main.m
//  Assignment2.1
//
//  Created by Emil Klarskov Kristensen on 1/16/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *firstCitizen = [[Citizen alloc] initWithFirstName:@"Abraham" lastName:@"Lincoln" sex:male andAge:@50];
        Citizen *secondCitizen = [[Citizen alloc] initWithFirstName:@"Mary" lastName:@"Todd" sex:female andAge:@45];
        
        [firstCitizen marry:secondCitizen];
        
        NSLog(@"%@ is married to %@", firstCitizen.firstName, firstCitizen.spouse.firstName);
        
    }
    return 0;
}

