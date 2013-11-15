//
//  Hunter.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Hunter.h"
#define LIFE 200;
#define POWER 200;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 30;
#define MAGICATTACK 0;
//attribute
#define STRONGE 5;
#define AGILE 20;
#define INTELLIGENCE 0;

@implementation Hunter
- (id)init{
    if (self = [super init]) {
        [self initAttribute];
        [self initElements:ccp(120, 270)];
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
    CCSprite *sprite = [CCSprite spriteWithFile:@"class_hunter.jpg"];
    
    Type life; life.current = LIFE; life.max = LIFE;
    Type rage; rage.current = POWER; rage.max = POWER;
    Status *status = [[Status alloc] initWithSizeAndStatus:size Life:life Energy:rage];
    
    [super initElements:point :sprite :status];
}
- (id)copyWithSelf{
    return [[Hunter alloc] initWithPosition:[self position]];
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
    NSLog(@"=====1========%@",armyList);
    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *array = [emeny objectAtIndex:0];
    NSMutableArray *temp2 = [emeny objectAtIndex:1];
    [array  addObjectsFromArray:temp2];
    if ([array count] > 0) {
        int random = [Util random:0 :[array count]-1 ];
        BaseSprite *sprite = [array objectAtIndex:random];
        int damage = [self getDamage:sprite];
        [sprite setHurt:damage :array :layer];
        
//        Debuff *debuff = [[Debuff alloc] initWithDebuff:@"hunter-row1.ico" :0 :1 :0];
//        [self setDebuff:sprite :debuff];
    }
    NSLog(@"=====2========%@",armyList);
    
}

- (void)draw{
    [super draw];
}

@end
