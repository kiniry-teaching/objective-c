//
//  main.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProcessBuilder.h"
#import "Process.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        ProcessBuilder *processBuilder = [[ProcessBuilder alloc]initWithCommandStrings:@"/bin/echo", @"testing", @"now", nil];
        
        Process *process = [[Process alloc]initWithProcessBuilder:processBuilder];
        
        [process start];
        
        int exitStatus = [process waitFor];
        
        NSData *data = [[process getOutputStream] readDataToEndOfFile];
        
        NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"The process exited with exit code: %d, and wrote the following to stdout: %@", exitStatus, output);
        
    }
    return 0;
}

