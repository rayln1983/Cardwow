//
//  Druid.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Druid.h"
#define LIFE 200;
#define POWER 200;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 50;
#define MAGICATTACK 20;
//attribute
#define STRONGE 25;
#define AGILE 10;
#define INTELLIGENCE 25;

@implementation Druid
- (id)init{
    if (self = [super init]) {
        [self initAttribute];
        [self initElements:ccp(40, 210)];
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
    CCSprite *sprite = [CCSprite spriteWithFile:@"class_druid.jpg"];
    
    Type life; life.current = LIFE; life.max = LIFE;
    Type rage; rage.current = POWER; rage.max = POWER;
    Status *status = [[Status alloc] initWithSizeAndStatus:size Life:life Energy:rage];
    
    [super initElements:point :sprite :status];
    
    [status release];
}
- (id)copyWithSelf{
    return [[Druid alloc] initWithPosition:[self position]];
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
        BaseSprite *sprite = [self randomHunterByDot:array :layer :armyList :.5 :.3];
        
        Debuff *debuff = [[Debuff alloc] initWithDebuff:@"druid-row1.ico" :3 :4 :0];
        [debuff setEffect:sprite.dot];
        [self setDebuff:sprite :debuff];
        
        [debuff release];
    }
    
    
}
- (void)skill2:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *alias = [armyList objectAtIndex:1];
    NSMutableArray *array = [self getEmenyList:alias];
    if ([array count] > 0) {
        int random = [Util random:0 :[array count]-1 ];
        BaseSprite *sprite = [array objectAtIndex:random];
        Buff *buff = [[Buff alloc] initWithBuff:@"druid-row2.ico" :3 :4 :1];
//        [buff setEffect: [self getHealValue:self]/2];
        [self setBuff:sprite :buff];
        //[sprite armor].current = [sprite armor].current/2 + [sprite armor].current;
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
        [self setHealToTarget:healvalue/2 :sprite1];
        [self setBuffAll:sprite1 :armyList];
        if ([sortArray count] >= 2) {
            BaseSprite *sprite2 = [sortArray objectAtIndex:1];
            int healvalue = [self getHealValue:sprite2];
            [self setHealToTarget:healvalue/2 :sprite2];
            [self setBuffAll:sprite2 :armyList];
        }
        if ([sortArray count] >= 3) {
            BaseSprite *sprite2 = [sortArray objectAtIndex:2];
            int healvalue = [self getHealValue:sprite2];
            [self setHealToTarget:healvalue/2 :sprite2];
            [self setBuffAll:sprite2 :armyList];
        }
    }
}

- (void)setBuffAll:(BaseSprite *)sprite :(NSMutableArray *)armyList{
    Buff *buff = [[Buff alloc] initWithBuff:@"druid-row3.ico" :3 :4 :2];
    [buff setEffect: [self getHealValue:self]/3];
    [self setBuff:sprite :buff];
    [sprite calcBuffAndDebuff:armyList];
    [buff release];
}
- (void)draw{
    [super draw];
}

@end
