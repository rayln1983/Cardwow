//
//  Warlock.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Warlock.h"
#define LIFE 200;
#define POWER 200;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 30;
#define MAGICATTACK 20;
//attribute
#define STRONGE 10;
#define AGILE 5;
#define INTELLIGENCE 30;
@implementation Warlock

- (id)init{
    if (self = [super init]) {
        [self initAttribute];
        [self initElements:ccp(280, 210)];
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
    CCSprite *sprite = [CCSprite spriteWithFile:@"class_warlock.jpg"];
    
    Type life; life.current = LIFE; life.max = LIFE;
    Type rage; rage.current = POWER; rage.max = POWER;
    Status *status = [[Status alloc] initWithSizeAndStatus:size Life:life Energy:rage];
    
    [super initElements:point :sprite :status];
    
    [status release];
}
- (id)copyWithSelf{
    return [[Warlock alloc] initWithPosition:[self position]];
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
        [self randomHunter:array :layer :armyList];
    }
}

- (void)skill2:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *alias = [armyList objectAtIndex:0];
    NSMutableArray *array = [self getEmenyList:alias];
    if ([array count] > 0) {
        int random = [Util random:0 :[array count]-1 ];
        BaseSprite *sprite = [array objectAtIndex:random];
        Debuff *debuff = [[Debuff alloc] initWithDebuff:@"warlock-row2.ico" :3 :7 :1];
        [self setDebuff:sprite :debuff];
        
        [debuff release];
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
        [self setHealToTarget:healvalue :sprite1];
        
    }
}

- (void)draw{
    [super draw];
}
@end
