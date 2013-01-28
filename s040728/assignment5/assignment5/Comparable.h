//
//  Comparable.h
//  assignment5
//
//  Created by Magloire on 1/23/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Comparable <NSObject>
@optional
-(NSComparisonResult) compare:(id) obj2;
@end
