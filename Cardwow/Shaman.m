//
//  Shaman.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Shaman.h"
#define LIFE 200;
#define POWER 200;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 30;
#define MAGICATTACK 50;
//attribute
#define STRONGE 5;
#define AGILE 10;
#define INTELLIGENCE 15;

@implementation Shaman
- (id)init{
    if (self = [super init]) {
        
        [self initElements:ccp(280, 270)];
        [self initAttribute];
    }
    return self;
}
- (id)initWithPosition:(CGPoint)point{
    if (self = [super init]) {
        [self initAttribute];
        [self initElements:point];
    }
    return self;
}
- (void)initElements:(CGPoint)point{
    
    CGSize size = CGSizeMake(56, 56);
    CCSprite *sprite = [CCSprite spriteWithFile:@"class_shaman.jpg"];
    
    Type life; life.current = LIFE; life.max = LIFE;
    Type rage; rage.current = POWER; rage.max = POWER;
    Status *status = [[Status alloc] initWithSizeAndStatus:size Life:life Energy:rage];
    
    [super initElements:point :sprite :status];
    
    [status release];
}
- (id)copyWithSelf{
    return [[Shaman alloc] initWithPosition:[self position]];
}

- (void)initAttribute{
    Type life; life.current = LIFE; life.max = LIFE;
    self.status.life = life;
    Type power; power.current = POWER; power.max = POWER;
    self.status.power = power;
    
    _armor.current = ARMOR;
    _armor.max = ARMOR;
    
    _defense.current = DEFENSE;
    _defense.max = DEFENSE;
    
    _attack.current = ATTACK;
    _attack.max = ATTACK;
    
    _magicAttack.current = MAGICATTACK;
    _magicAttack.max = MAGICATTACK;
    
    _stronge.current = STRONGE;
    _stronge.max = STRONGE;
    
    _agile.current = AGILE;
    _agile.max = AGILE;
    
    _intelligence.current = INTELLIGENCE;
    _intelligence.max = INTELLIGENCE;
}

- (void)skill1:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *array = [self getEmenyList:emeny];
    if ([array count] > 0) {
        [self randomHunterByMagic:array :layer :armyList];
    }
}

- (void)skill2:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [self getEmenyList:alias];

    for (BaseSprite *sprite in array) {
        Buff *buff = [[Buff alloc] initWithBuff:@"shaman-row2.ico" :2 :3 :1];
        [self setBuff:sprite :buff];
        [sprite calcBuffAndDebuff:armyList];
        [buff release];
    }
}

- (void)skill3:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [self getEmeny2RowList:alias];
    if ([array count] > 0) {
        NSArray *sortArray = [self sortListByLif:array];
        BaseSprite *sprite1 = [sortArray objectAtIndex:0];
        int healvalue = [self getHealValue:sprite1];
        [self setHealToTarget:healvalue/3*2 :sprite1];
        
        if ([sortArray count] >= 2) {
            BaseSprite *sprite2 = [sortArray objectAtIndex:1];
            int healvalue = [self getHealValue:sprite2];
            [self setHealToTarget:healvalue/3*2 :sprite2];
        }
        if ([sortArray count] >= 3) {
            BaseSprite *sprite2 = [sortArray objectAtIndex:2];
            int healvalue = [self getHealValue:sprite2];
            [self setHealToTarget:healvalue/3*2 :sprite2];
        }
    }
    
    
    
}

- (void)draw{
    [super draw];
}

@end
