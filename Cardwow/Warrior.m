//
//  Warrior.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Warrior.h"
#define LIFE 200;
#define POWER 100;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 30;
#define MAGICATTACK 0;

#define STRONGE 20;
#define AGILE 5;
#define INTELLIGENCE 0;

#define FONTSIZE 30;

@implementation Warrior
- (id)init{
    if (self = [super init]) {
        [self initAttribute];
        [self initElements];
    }
    return self;
}
- (void)initElements{
    
    CGSize size = CGSizeMake(56, 56);
    CCSprite *sprite = [CCSprite spriteWithFile:@"class_warrior.jpg"];
    
    Type life; life.current = LIFE; life.max = LIFE;
    Type rage; rage.current = POWER; rage.max = POWER;
    Status *status = [[Status alloc] initWithSizeAndStatus:size Life:life Energy:rage];
    
    [super initElements:ccp(40, 270) :sprite :status];
}
- (id)copyWithSelf{
    return [[Warrior alloc] init];
}

- (void)initAttribute{
    _life.current = LIFE;
    _life.max = LIFE;
    
    _power.current = POWER;
    _power.max = POWER;
    
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

- (void)draw{
    [super draw];
}
@end
