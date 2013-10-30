//
//  Shaman.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Shaman.h"
#define LIFE 200;
#define POWER 0;
#define ARMOR 20;
#define DEFENSE 10;
#define ATTACK 30;
#define MAGICATTACK 0;

@implementation Shaman
- (id)copyWithSelf:(CCLayer *)layer{
    Shaman *temp = [[Shaman alloc] initWithFile:@"class_shaman.jpg"];
    temp.position = self.position;
    [layer addChild:temp];
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
}

- (void)draw{
    
    [super draw];
    [self drawLife];
    [self drawPower];
}

- (void)drawLife{
    glLineWidth( 7.0f );
    INIT_LIFE_COLOR;
    ccDrawLine( ccp(0, 3), ccp(self.contentSize.width, 3) );
}
- (void)drawPower{
    glLineWidth( 5.0f );
    INIT_POWER_COLOR;
    ccDrawLine( ccp(0, 0), ccp(self.contentSize.width, 0) );
}

@end
