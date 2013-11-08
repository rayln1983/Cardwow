//
//  BaseSprite.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "BaseSprite.h"


@implementation BaseSprite

- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (BOOL)setLife:(int)damage :(NSMutableArray *)array :(CCLayer *)layer{
    _life.current = _life.current - damage;
    if (_life.current <=0) {
        _life.current = 0;
        [array removeObject:self];
        [layer removeChild:self cleanup:YES];
        return YES;
    }
    return NO;
}

- (void)setDamageFont:(int)damage :(CCLayer *)layer :(NSMutableArray *)params{
    
    [_point setColor:ccRED];
    [_point setString:[NSString stringWithFormat:@"-%i",damage]];
    CCFadeOut *action = [CCFadeOut actionWithDuration:1];
    [_point runAction:action];
    	
}

- (void)setDamageFont:(int)damage{
    
    [_point setColor:ccRED];
    [_point setString:[NSString stringWithFormat:@"-%i",damage]];
    CCFadeOut *action = [CCFadeOut actionWithDuration:1];
    [_point runAction:action];
    
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

- (Type)getLife{
    return _life;
}

//- (void)skill1:(NSMutableArray *)array :(NSMutableArray *)params :(SEL)selector{
//    CCLayer *layer = [params objectAtIndex:3];
//    for (int i = [array count]-1 ; i >=0; i--) {
//        BaseSprite *sprite = [array objectAtIndex:i];
//        [sprite setDamageFont:[self getAttack].current :layer :params];
//        [sprite setLife:[self getAttack].current :array :layer];
//    }
//    
//}
- (void)skill1:(NSMutableArray *)array :(CCLayer *)layer{
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
        [sprite setDamageFont:[self getAttack].current];
        [sprite setLife:[self getAttack].current :array :layer];
    }
    
}
- (void)skill2:(NSMutableArray *)array :(CCLayer *)layer{
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
        [sprite setDamageFont:[self getAttack].current];
        [sprite setLife:[self getAttack].current :array :layer];
    }
    
}
- (void)skill3:(NSMutableArray *)array :(CCLayer *)layer{
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
        [sprite setDamageFont:[self getAttack].current];
        [sprite setLife:[self getAttack].current :array :layer];
    }
    
}
- (void)skilltest:(NSMutableArray *)array :(NSMutableArray *)params :(SEL)selector{
    CCFadeOut *action = [CCFadeOut actionWithDuration:1];
    CCCallFuncND *func = [CCCallFuncND actionWithTarget:[params objectAtIndex:3] selector:selector data:params];
    CCSequence *seq = [CCSequence actions:action,func, nil];
    [_point runAction:seq];
    
}
@end
