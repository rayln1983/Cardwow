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
        [layer removeChild:_point cleanup:YES];
        [layer removeChild:self cleanup:YES];
        return YES;
    }
    return NO;
}
- (void)fontAnimation{
    CCScaleTo *scale1 = [CCScaleTo actionWithDuration:.1 scale:1.5];
    CCScaleTo *scale2 = [CCScaleTo actionWithDuration:.1 scale:1.0];
    CCFadeOut *action = [CCFadeOut actionWithDuration:.8];
    CCSequence *se = [CCSequence actions:scale1,scale2,action, nil];
    [_point runAction:se];
}
- (void)setGreenFont:(NSString *)str{
    [_point setColor:ccGREEN];
    [_point setOpacity:255];
    [_point setString:str];
//    CCFadeOut *action = [CCFadeOut actionWithDuration:1];
//    [_point runAction:action];
    [self fontAnimation];
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

- (BOOL)setHurt:(int)damage :(NSMutableArray *)array :(CCLayer *)layer{
    [self setDamageFont:[self getAttack].current];
    return [self setLife:[self getAttack].current :array :layer];
}

- (void)setDamageFont:(int)damage{
    [_point setOpacity:255];
    [_point setColor:ccRED];
    [_point setString:[NSString stringWithFormat:@"-%i",damage]];
//    CCFadeOut *action = [CCFadeOut actionWithDuration:1];
//    [_point runAction:action];
    [self fontAnimation];
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

- (void)shooter{
    CCScaleTo *scale1 = [CCScaleTo actionWithDuration:.1 scale:1.2];
    CCScaleTo *scale2 = [CCScaleTo actionWithDuration:.1 scale:1];
    CCSequence *se = [CCSequence actions:scale1,scale2, nil];
    [self runAction:se];
}
- (void)shootered{
    CCScaleTo *scale1 = [CCScaleTo actionWithDuration:.1 scale:.8];
    CCScaleTo *scale2 = [CCScaleTo actionWithDuration:.1 scale:1];
    CCSequence *se = [CCSequence actions:scale1,scale2, nil];
    [self runAction:se];
}

- (void)skill1:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *emeny = [armyList objectAtIndex:0];
//    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [emeny objectAtIndex:0];
    if ([array count] > 0) {
        int random = [Util random:0 :[array count]-1 ];
        BaseSprite *sprite = [array objectAtIndex:random];
        
        [sprite setHurt:[self getAttack].current :array :layer];
    }
    
}
- (void)skill2:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
//    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [alias objectAtIndex:0];
    
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
        [sprite setHeal:[self getMagicAttack].current :array :layer];
    }
    
}
- (void)skill3:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *emeny = [armyList objectAtIndex:0];
//    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [emeny objectAtIndex:0];
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
        [sprite setHeal:[self getMagicAttack].current :array :layer];
    }
    
}

@end
