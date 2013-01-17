//
//  NoblePerson.h
//  Assignment2.1
//
//  Created by Emil Klarskov Kristensen on 1/16/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen

@property NSInteger numberOfAssets;
@property (strong)Citizen *butler;
@property (strong) NoblePerson *spouse;

-(void)marry:(Citizen *)citizen;

@end
