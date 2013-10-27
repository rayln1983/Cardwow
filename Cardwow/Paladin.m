//
//  Paladin.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Paladin.h"


@implementation Paladin

- (id)copyWithSelf:(CCLayer *)layer{
    Paladin *temp = [[Paladin alloc] initWithFile:@"class_paladin.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    return temp;
}
@end
