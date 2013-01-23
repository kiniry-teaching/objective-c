//
//  Citizen.h
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/11/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Citizen : NSObject

@property NSValue* age;
@property NSString* firstName;
@property NSString* lastName;
@property NSString* sex;
@property (nonatomic) Citizen* marry;
@property (nonatomic) Citizen* mother;
@property (nonatomic) Citizen* father;
@property (nonatomic) Citizen* spouse;

- (void) marry:(Citizen *)sweetheart;
- (void) divorce;

- (BOOL) can_marry:(Citizen*)other;
- (BOOL) isSingle;

@end
