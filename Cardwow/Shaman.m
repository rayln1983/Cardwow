//
//  Shaman.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Shaman.h"


@implementation Shaman
- (id)copyWithSelf:(CCLayer *)layer{
    Shaman *temp = [[Shaman alloc] initWithFile:@"class_shaman.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    return temp;
}
@end
