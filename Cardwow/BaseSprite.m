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
        [layer removeChild:[self point] cleanup:YES];
        return YES;
    }
    return NO;
}

- (void)setGreenFont:(NSString *)str{
    [_point setColor:ccGREEN];
    [_point setOpacity:255];
    [_point setString:str];
    CCFadeOut *action = [CCFadeOut actionWithDuration:1];
    [_point runAction:action];
}

- (BOOL)setHeal:(int)damage :(NSMutableArray *)array :(CCLayer *)layer{
    [self setGreenFont:[NSString stringWithFormat:@"+%i",damage]];
    _life.current = _life.current + damage;
    if (_life.current >= _life.max) {
        _life.current = _life.max;
        
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

- (void)setAgile:(int)agile{
    _agile.current = _agile.current+agile;
}

- (int)getRow{
    return _row;
}

- (void)setRow:(int)row{
    _row = row;
}

- (Type)getMagicAttack{
    return _magicAttack;
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
- (void)skill1:(NSMutableArray *)armyList :(CCLayer *)layer{
    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [emeny objectAtIndex:0];
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
        [sprite setDamageFont:[self getAttack].current];
        [sprite setLife:[self getAttack].current :array :layer];
    }
    
}
- (void)skill2:(NSMutableArray *)armyList :(CCLayer *)layer{
    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [alias objectAtIndex:0];
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
//        [sprite setDamageFont:[self getAttack].current];
//        [sprite setLife:[self getAttack].current :array :layer];
        NSLog(@"====heal==%i",[self getMagicAttack].current);
        [sprite setHeal:[self getMagicAttack].current :array :layer];
    }
    
}
- (void)skill3:(NSMutableArray *)armyList :(CCLayer *)layer{
    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [emeny objectAtIndex:0];
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
//        [sprite setHeal:[self getAttack].current];
        [sprite setHeal:[self getMagicAttack].current :array :layer];
    }
    
}
- (void)skilltest:(NSMutableArray *)array :(NSMutableArray *)params :(SEL)selector{
    CCFadeOut *action = [CCFadeOut actionWithDuration:1];
    CCCallFuncND *func = [CCCallFuncND actionWithTarget:[params objectAtIndex:3] selector:selector data:params];
    CCSequence *seq = [CCSequence actions:action,func, nil];
    [_point runAction:seq];
    
}
@end
