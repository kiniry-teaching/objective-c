//
//  NoblePerson.m
//  Assignment3-Logging
//
//  Created by Andreas Haure on 17/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "NoblePerson.h"

static int priceForNobleMarriage = 50000;

@implementation NoblePerson

- (Citizen *)initWithName:(NSString *)name
                  withSex:(NSString *)sex
                  withAge:(NSNumber *)age
               withAssets:(float) assets
{
    self = [super initWithName:name withSex:sex withAge:age];
    if (self)
    {
        _assets = assets;
    }
    return self;
}
- (void)marry:(Citizen *)APerson
{
    // Check if a valid Citizen is passed in
    if (!APerson){
        NSLog(@"Precondition violation: You didn't specify a Citizen to marry");
    }
    // Check if possible spouse is a Noble Person
    if([APerson isKindOfClass:[NoblePerson class]]){
        //Person is a NoblePerson, we create such an instance:
        NoblePerson *ANoblePerson = (NoblePerson *)APerson;
        
        //Check wheter the two persons can be married
        if ([super canMarry:APerson]){
            //Check whether any of the Noble persons prepared for marriage have a butler specified
            if((ANoblePerson.butler || self.butler)){
                //We mary the two noble persons using the Citizen mary method
                [super marry:ANoblePerson];
                
                //We update their new assets
                double oldAssets = self.assets + ANoblePerson.assets;
                double newAssets = oldAssets - priceForNobleMarriage;
                ANoblePerson.assets = newAssets;
                self.assets = newAssets;
                
                //The one that has a butler shares it with his/her new noble spouse
                if (self.butler){
                    ANoblePerson.butler = self.butler;
                } else if (ANoblePerson.butler){
                    self.butler = ANoblePerson.butler;
                }
                
                //Check postconditions
                if (debug && !(self.butler && ANoblePerson.butler)){
                    NSLog(@"Postcondition violation: The butler wasn't set correctly for both noble persons after wedding");
                }
                if (debug && !(self.assets <= oldAssets - priceForNobleMarriage)){
                    NSLog(@"Postcondition violation: Your assets were not updated correctly");
                }
                if (debug && !(ANoblePerson.assets <= oldAssets - priceForNobleMarriage)){
                    NSLog(@"Postcondition violation: Your sweethearts assets were not updated correctly");
                }
            } else {
                if (debug){
                    NSLog(@"No butler - No Marriage!");
                }
                return;
            }
        }
        else {
            if (debug){
                NSLog(@"Not a legal marriage - leads to incest or homosexuality or polygyni");
            }
            return;
        }
    } else {
        if (debug){
            NSLog(@"Precondition violation: Your spouse is not a noble person");
        }
        return;
    }
}
- (void)setButler:(Citizen *)APerson
{
    if (debug && !APerson){
        NSLog(@"Precondition violation: You didn't specify a Citizen as butler");
    } else {
        if (debug && [APerson isKindOfClass:[NoblePerson class]]){
            NSLog(@"Precondition violation: You can't add a noble butler");
        } else {
            _butler = APerson;
            NSLog(@"You %@ just added a butler %@",self.name,self.butler.name);
        }

    }
    if (debug && !(self.butler == APerson)){
        NSLog(@"Postcondition violation: The butler wasn't set correctly");
    }
}
- (NSString *)description
{
    // Print NoblePerson discription using Citizen description method and adding assets and butler
    NSString *citizenDescription = [super description];
    NSString *currentAssets = [NSString stringWithFormat:@", Current assets: %f",self.assets];
    NSString *butlerName = [NSString stringWithFormat:@", Butler name: %@", self.butler.name];
    return [[citizenDescription stringByAppendingString:currentAssets] stringByAppendingString:butlerName];
}

@end