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
        _debuffList = [[NSMutableArray alloc] init];
        _buffList = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)initElements:(CGPoint)point :(CCSprite *)sprite :(Status *)status{
    //init icon
    CGSize size = CGSizeMake(56, 56);
    [self addChild:sprite];
    
    //init status
    [self addChild:status];
    
    //init font
    CCLabelTTF *damage = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:30 ];
    [self addChild:damage z:1];
    
    //init node status
    self.contentSize = size;
    self.tag = 1;
    self.position = point;
    self.point = damage;
    self.status = status;
}
- (BOOL)setLife:(int)damage :(NSMutableArray *)array :(CCLayer *)layer{
    Type life = self.status.life;
    life.current = life.current - damage;
//    self.status.life.current = self.status.life.current - damage;
    if (life.current <=0) {
        life.current = 0;
        self.status.life = life;
//        [array removeObject:self];
        [layer removeChild:_point cleanup:YES];
        [layer removeChild:self cleanup:YES];
        return YES;
    }
    self.status.life = life;
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
    Type life = self.status.life;
    life.current = life.current + damage;
    if (self.status.life.current >= self.status.life.max) {
        life.current = life.max;
        self.status.life = life;
        return YES;
    }
    self.status.life = life;
    return NO;
}

- (BOOL)setHurt:(int)damage :(NSMutableArray *)array :(CCLayer *)layer{
    [self setDamageFont:damage];
    return [self setLife:damage :array :layer];
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

- (void)initFontLayout:(CGPoint)point{
    [_point setPosition:point];
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
//    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [alias objectAtIndex:0];
    for (int i = [array count]-1 ; i >=0; i--) {
        BaseSprite *sprite = [array objectAtIndex:i];
        [sprite setHeal:[self getMagicAttack].current :array :layer];
    }
    
}

- (void)clearDebuff:(Debuff *)debuff{
    [_debuffList enumerateObjectsUsingBlock:^(Debuff *obj, NSUInteger idx, BOOL *stop) {
        if (obj.row == debuff.row && obj.nType == debuff.nType ) {
            [_debuffList removeObject:obj];
            [self removeChild:obj cleanup:YES];
            stop = YES;
        }
    }];
}

- (void)clearBuff:(Buff *)buff{
    [_buffList enumerateObjectsUsingBlock:^(Buff *obj, NSUInteger idx, BOOL *stop) {
        if (obj.row == buff.row && obj.nType == buff.nType ) {
            [_buffList removeObject:obj];
            [self removeChild:obj cleanup:YES];
            stop = YES;
        }
    }];
}

- (CGPoint)getDebuffPosition{
    CGPoint initPosition = ccp(28, 28);
    initPosition.y = initPosition.y - ([_debuffList count] - 1)*12;
    return initPosition;
}

- (CGPoint)getBuffPosition{
    CGPoint initPosition = ccp(-28, 28);
    initPosition.y = initPosition.y - ([_buffList count] - 1)*12;
    return initPosition;
}

- (int)getDamage:(BaseSprite *)emeny{
    int damage = [self getAttack].current;
    NSMutableArray *bufflist = [emeny buffList];
    for (int i = [bufflist count] - 1; i >= 0; i--) {
        Buff *buff = [bufflist objectAtIndex:i];
        if ([buff nType]==0 && [buff row]==1) {
            damage = 0;
            [bufflist removeObject:buff];
            [buff removeFromParentAndCleanup:YES];
            break;
        }
    }

    return damage;
}

- (void)setDebuff:(BaseSprite *)sprite :(Debuff *)debuff{
    
    [sprite clearDebuff:debuff];
    [sprite addChild:debuff];
    if ([debuff duration]>0) {
        [sprite.debuffList addObject:debuff];
        
    }
    [debuff move:[sprite getDebuffPosition]];
}

- (void)setBuff:(BaseSprite *)sprite :(Buff *)buff{
    
    [sprite clearBuff:buff];
    [sprite addChild:buff];
    if ([buff duration]>0) {
        [sprite.buffList addObject:buff];
        [buff move:[sprite getBuffPosition]];
    }
    
}

- (BaseSprite *)randomHunter:(NSMutableArray *)array :(CCLayer *)layer :(NSMutableArray *)armyList{
    int random = [Util random:0 :[array count]-1 ];
    BaseSprite *sprite = [array objectAtIndex:random];
    int damage = [self getDamage:sprite];
    BOOL isdead = [sprite setHurt:damage :array :layer];
    if (isdead) {
        [self clearDeadSprite:armyList :sprite];
    }
    return sprite;
}

- (void)clearDeadSprite:(NSMutableArray *)armyList :(BaseSprite *)sprite{
    for (NSMutableArray *army in armyList) {
        for (NSMutableArray *row in army) {
            for (int i = [row count] - 1; i >= 0; i--) {
                BaseSprite *temp = [row objectAtIndex:i];

                Status *status = [temp status];
                if ([status life].current <= 0) {
                    [row removeObject:temp];
                }
            }
        }
    }
}

- (NSMutableArray *)getEmenyList:(NSMutableArray *)emeny{
    if ([[emeny objectAtIndex:0] count] > 0) {
        return [emeny objectAtIndex:0];
    }else if ([[emeny objectAtIndex:1] count] > 0){
        return [emeny objectAtIndex:1];
    }else{
        return [emeny objectAtIndex:2];
    }
}

- (void)dealloc{
    [_status release];
    [_point release];
    [_debuffList release];
    [_buffList release];
    [super dealloc];
}

@end
