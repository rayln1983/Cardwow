//
//  Warlock.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Warlock.h"


@implementation Warlock
- (id)copyWithSelf:(CCLayer *)layer{
    Warlock *temp = [[Warlock alloc] initWithFile:@"class_warlock.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    return temp;
}
@end
