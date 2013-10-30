//
//  Hunter.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Hunter.h"
#define LIFE 200;
#define POWER 0;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 30;
#define MAGICATTACK 0;

@implementation Hunter

- (id)init{
    if (self = [super init]) {
        [self initAttribute];
    }
    return self;
}

- (id)copyWithSelf:(CCLayer *)layer{
    Hunter *temp = [[Hunter alloc] initWithFile:@"class_hunter.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
    [temp initAttribute];
    return temp;
}

- (void)initAttribute{
    _life.current = LIFE;
    _life.max = LIFE;
    //NSLog(@"==========%f, %f",_life.current, _life.max);
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
    //NSLog(@"_life.current: %f, %f, %f",_life.current,_life.max,percent);
    ccDrawLine( ccp(0, 3), ccp(self.contentSize.width*percent, 3) );
}
- (void)drawPower{
    glLineWidth( 5.0f );
    INIT_POWER_COLOR;
    float percent = _life.current/_life.max;
    ccDrawLine( ccp(0, 0), ccp(self.contentSize.width*percent, 0) );
}

@end
