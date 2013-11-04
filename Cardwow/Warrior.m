//
//  Warrior.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Warrior.h"
#define LIFE 200;
#define POWER 200;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 30;
#define MAGICATTACK 0;

#define STRONGE 20;
#define AGILE 5;
#define INTELLIGENCE 0;

@implementation Warrior
- (id)init{
    if (self = [super init]) {
        [self initAttribute];
    }
    return self;
}
- (id)copyWithSelf:(CCLayer *)layer{
    Warrior *temp = [[Warrior alloc] initWithFile:@"class_warrior.jpg"];
    temp.position = self.position;
    temp.tag = 1;
    [layer addChild:temp];
    [temp initAttribute];
    return temp;
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
    [self drawLife];
    [self drawPower];
}

- (void)drawLife{
    glLineWidth( 7.0f );
    INIT_LIFE_COLOR;
    float percent = _life.current/_life.max;
    ccDrawLine( ccp(0, 3), ccp(self.contentSize.width * percent, 3) );
}
- (void)drawPower{
    glLineWidth( 5.0f );
    INIT_POWER_COLOR;
    float percent = _power.current/_power.max;
    ccDrawLine( ccp(0, 0), ccp(self.contentSize.width * percent, 0) );
}
@end
