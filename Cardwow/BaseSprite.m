//
//  BaseSprite.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "BaseSprite.h"


@implementation BaseSprite

- (void)setLife:(float)damage{
    _life.current = _life.current - damage;
    NSLog(@"_life.current: %f",_life.current);
}
@end
