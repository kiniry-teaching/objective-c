//
//  Random.m
//  Assignment5
//
//  Created by Jonas Eriksen on 01/02/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import "Random.h"

@interface Random ()

+ (long) newRandomSeed;

- (int)  randomIntWithBitlength:(int)bits;

@end

@implementation Random

static Random *_defaultRandomGenerator; // Static Random generator used for class factory methods

@synthesize seed = _seed;

// allocate and initiate a new Random generator with the given seed
+ (id) newWithSeed:(unsigned long)seed
{
    return [[Random alloc] initWithSeed:seed];
}

// Generate a random seed to use when a Random generator is initiated without a seed
+ (long) newRandomSeed
{
    // create a random seed using the arc4 implementation provided by libc
    return ((long) arc4random() << 32) + arc4random();
}

// Static Random generator used for class factory methods, for singleton like behavior
+ (Random *) defaultGenerator
{
    if( ! _defaultRandomGenerator )
        _defaultRandomGenerator = [Random new];
    
    return _defaultRandomGenerator;
}

// class factory methods using defaultGenerator, see the equivalent instance methods  for details

+ (BOOL) randomBool
{
    return [[Random new] randomBool];
}

+ (int) randomInt
{
    return [[Random defaultGenerator] randomInt];
}

+ (int) randomIntBelowInt:(int)ceiling
{
    return [[Random defaultGenerator] randomIntBelowInt:ceiling];
}

+ (long) randomLong
{
    return [[Random defaultGenerator] randomLong];
}

+ (float) randomFloat
{
    return [[Random defaultGenerator] randomFloat];
}

+ (double) randomDouble
{
    return [[Random defaultGenerator] randomDouble];
}

+ (double) randomGausianDouble
{
    return [[Random defaultGenerator] randomGaussianDouble];
}



// default initialization method
- (id) initWithSeed:(unsigned long)seed
{
    self = [super init];
    
    if(self)
        [self setSeed:seed];

    return self;
}

// initialize without a given seeed
- (id) init
{
    // generate a seed
    long seed = [Random newRandomSeed];
    // call default initialization method
    [self initWithSeed:seed];
    
    return self;
}

// set the Random generator to the exact same state as if initialized with the given seed
-(void) setSeed:(unsigned long)seed
{
    _seed = (seed ^ 0x5DEECE66DL) & ((1L << 48) - 1);
}

// private method used by all other methods
- (int) randomIntWithBitlength:(int)bits
{
    // scramble seed
    self.seed = (self.seed * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
    // return the hight order bits as the lower bits are less random in linear congruential generators
    return (int)(self.seed >> (48 - bits));
}

- (BOOL) randomBool
{
    return [self randomIntWithBitlength:1] != 0;
}

- (int) randomInt
{
    return [self randomIntWithBitlength:32];
}

- (int) randomIntBelowInt:(int)ceiling
{
    if (ceiling <= 0)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Ceiling in randomIntBelowInt must be positive" userInfo:nil];

    if ((ceiling & -ceiling) == ceiling)    // special treatment if ceiling is a power of 2
        return (int) ( (ceiling * (unsigned long) [self randomIntWithBitlength:31]) >> 31);
    
    int bits, val;
    do {
        bits = [self randomIntWithBitlength:31];
        val = bits % ceiling;
    } while (bits - val + (ceiling-1) < 0);
    return val;
}

- (long) randomLong
{
    // long is generated by two calls for a random int
    return ( (long) [self randomIntWithBitlength:32] << 32) + [self randomIntWithBitlength:32];
}

- (float) randomFloat
{
    return [self randomIntWithBitlength:24] / ((float)(1 << 24));
}

- (double) randomDouble
{
    return (( (long int) [self randomIntWithBitlength:26] << 27)
            + [self randomIntWithBitlength:27]) / (double)(1L << 53);
}

- (double) randomGaussianDouble
{
    NSLog(@"Not implemented");
    assert(false);
}


@end

