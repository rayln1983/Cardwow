//
//  Mage.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Mage.h"


@implementation Mage
- (id)copyWithSelf:(CCLayer *)layer{
    Mage *temp = [[Mage alloc] initWithFile:@"class_mage.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    return temp;
}
@end
