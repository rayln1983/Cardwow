//
//  Priest.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Priest.h"


@implementation Priest
- (id)copyWithSelf:(CCLayer *)layer{
    Priest *temp = [[Priest alloc] initWithFile:@"class_priest.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    return temp;
}
@end
