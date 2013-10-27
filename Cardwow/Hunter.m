//
//  Hunter.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Hunter.h"


@implementation Hunter

- (id)copyWithSelf:(CCLayer *)layer{
    Hunter *temp = [[Hunter alloc] initWithFile:@"class_hunter.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    return temp;
}
@end
