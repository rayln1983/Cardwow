//
//  Druid.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Druid.h"


@implementation Druid
- (id)copyWithSelf:(CCLayer *)layer{
    Druid *temp = [[Druid alloc] initWithFile:@"class_druid.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    return temp;
}
@end
