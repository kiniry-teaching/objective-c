#import "NoblePerson.h"

@implementation NoblePerson

@synthesize assets = _assets;
@synthesize butler = _butler;

// Constraint: Must have enough property (assets) for independance
- (void) setAssets:(NSNumber*)assets
{
  if ([assets intValue] < 50000)
    return;

  _assets = assets;
}


// Constraints: 
// #1: Can only marry other nogle person
// #2: Must have a butler
- (BOOL) isMarriableTo:(Citizen*)suitor
{
  // #1 + #2
  if (![suitor isKindOfClass:[NoblePerson class]]
      || !self.butler || ((NoblePerson*)suitor).butler)
    return NO;

  return [super isMarriableTo:suitor];
}

// Constraints:
// #1: Married nobility share their assets
// #2: Wedding celebrated with style
- (void) marryTo:(Citizen*)fiancee
{
  if ([self isMarriableTo:fiancee]) 
  {
    // #1

    NoblePerson* nobleFiancee = (NoblePerson*)fiancee;
    NSNumber* sharedAssets = [NSNumber numberWithFloat:(([self.assets intValue] + [nobleFiancee.assets intValue]) / 2)];
    self.assets = sharedAssets;
    nobleFiancee.assets = sharedAssets;

    //TODO this is highly uncool... 
    //    [super marryTo:fiancee];
    self.spouse = fiancee;
    fiancee.spouse = self;

    // #2
    NSLog(@"%@ just married %@ with style. Nice.", self.name, fiancee.name);
  }
}

@end
