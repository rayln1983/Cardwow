//
//  Warrior.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Warrior.h"


@implementation Warrior

- (id)copyWithSelf:(CCLayer *)layer{
    Warrior *temp = [[Warrior alloc] initWithFile:@"class_warrior.jpg"];
    temp.position = self.position;
    temp.tag = 1;
    [layer addChild:temp];
    
    return temp;
}
@end
