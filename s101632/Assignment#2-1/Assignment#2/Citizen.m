//
//  Citizen.m
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

- (Citizen*)initWithFirstName:(NSString *)fName sex:(Sex)sex
                          age:(NSNumber *)age{
    
    self = [super init];
    
    if (self) {
        self.name = fName;
        self.sex = sex;
        self.age = age;
        self.Children = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)impedimentToMarriage:(Citizen *)citizen{
    if (![self.Children containsObject:citizen]
        && self.father != citizen
        && self.mother != citizen
        && self.sex != citizen.sex
        && self.single
        && citizen.single){
        return YES;
        
    }else{
        return NO;
    }
}


- (void)marry:(Citizen *)aSpouse{
    if ([aSpouse class] == [Citizen class]
        &&[self impedimentToMarriage:aSpouse]) {
        
        self.spouse = aSpouse;
        aSpouse.spouse = self;
    }
    
}
/*
 Custom gettet method for the single boolean
 */
- (BOOL)single{
    if (self.spouse) {
        return NO;
    }else{
        return YES;
    }
}



@end

