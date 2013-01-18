//
//  main.m
//  Levenshtein distance
//
//  Created by Sivanujann Selliah on 18/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LevenshteinDistance.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *str1 = @"google";
        NSString *str2 = @"bing";
        
        int dist = [LevenshteinDistance distanceBetween:str1 And:str2];
        
        NSLog(@"The Levenshtein distance between %@ and %@ is %d.", str1, str2, dist);
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
    }
    return 0;
}

