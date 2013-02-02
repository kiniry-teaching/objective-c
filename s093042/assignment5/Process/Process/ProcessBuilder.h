//
//  ProcessBuilder.h
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProcessBuilder : NSObject
-(void)hejsa:(NSString *)hej, ...;
@end

/* 
 
 
 ProcessBuilder(List<String> command)
 Constructs a process builder with the specified operating system program and arguments.
 
 ProcessBuilder(String... command)
 Constructs a process builder with the specified operating system program and arguments.
 
 
 List<String>	command()
 Returns this process builder's operating system program and arguments.
 
 ProcessBuilder	command(List<String> command)
 Sets this process builder's operating system program and arguments.
 
 ProcessBuilder	command(String... command)
 Sets this process builder's operating system program and arguments.
 
 File	directory()
 Returns this process builder's working directory.
 
 ProcessBuilder	directory(File directory)
 Sets this process builder's working directory.
 
 Map<String,String>	environment()
 Returns a string map view of this process builder's environment.
 
 ProcessBuilder	inheritIO()
 Sets the source and destination for subprocess standard I/O to be the same as those of the current Java process.
 
 ProcessBuilder.Redirect	redirectError()
 Returns this process builder's standard error destination.
 
 ProcessBuilder	redirectError(File file)
 Sets this process builder's standard error destination to a file.
 
 ProcessBuilder	redirectError(ProcessBuilder.Redirect destination)
 Sets this process builder's standard error destination.
 
 boolean	redirectErrorStream()
 Tells whether this process builder merges standard error and standard output.
 
 ProcessBuilder	redirectErrorStream(boolean redirectErrorStream)
 Sets this process builder's redirectErrorStream property.
 
 ProcessBuilder.Redirect	redirectInput()
 Returns this process builder's standard input source.
 
 ProcessBuilder	redirectInput(File file)
 Sets this process builder's standard input source to a file.
 
 ProcessBuilder	redirectInput(ProcessBuilder.Redirect source)
 Sets this process builder's standard input source.
 
 ProcessBuilder.Redirect	redirectOutput()
 Returns this process builder's standard output destination.
 
 ProcessBuilder	redirectOutput(File file)
 Sets this process builder's standard output destination to a file.
 
 ProcessBuilder	redirectOutput(ProcessBuilder.Redirect destination)
 Sets this process builder's standard output destination.
 
 Process	start()
 Starts a new process using the attributes of this process builder.
 
 
 */