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
    
    [status release];
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
    NSMutableArray *emeny = [armyList objectAtIndex:0];
//    int row1 = 0;
//    int row2 = 1;
//    if ([[emeny objectAtIndex:0] count]<=0) {
//        row1 = 1;
//        row2 = 2;
//    }
//    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[emeny objectAtIndex:row1]];
//    NSMutableArray *temp2 = [[NSMutableArray alloc] initWithArray:[emeny objectAtIndex:row2]];
//    [array  addObjectsFromArray:temp2];
    NSMutableArray *array = [self getEmeny2RowList:emeny];
    if ([array count] > 0) {
        BaseSprite *sprite = [self randomHunter:array :layer :armyList];
        [array removeObject:sprite];
        if ([array count] > 0) {
            [self randomHunter:array :layer :armyList];
        }
        
    }
}

- (void)skill2:(NSMutableArray *)armyList :(CCLayer *)layer{
    [self shooter];
    NSMutableArray *emeny = [armyList objectAtIndex:0];
    NSMutableArray *array = [self getEmenyList:emeny];
    if ([array count] > 0) {
        [self randomHunter:array :layer :armyList];
        
    }
    
    //[array release];
}



- (void)draw{
    [super draw];
}

@end
