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
    if (_life.current <0) {
        _life.current = 0;
    }
    NSLog(@"_life.current: %f",_life.current);
}

- (Type)getAgile{
    return _agile;
}

- (int)getFlag{
    return _flag;
}

- (void)setFlag:(int)flag{
    _flag = flag;
}

- (Type)getAttack{
    return _attack;
}

- (void)skill1:(NSMutableArray *)array{
    for (BaseSprite *sprite in array) {
        [sprite setLife:[self getAttack].current];
    }
}
@end
