//
//  BaseSprite.h
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#define INIT_LIFE_COLOR ccDrawColor4B(81,133,54,255)
#define INIT_POWER_COLOR ccDrawColor4B(0,169,227,255)

typedef struct {
    float current;
    float max;
} Type;

@interface BaseSprite : CCSprite {
    int _flag;
    //life
    Type _life;
    //power
    Type _power;
    Type _armor;
    Type _defense;
    Type _attack;
    Type _magicAttack;
    
    Type _stronge;
    Type _agile;
    Type _intelligence;
    
}
//@property (nonatomic, assign) Type agile;

- (id)copyWithSelf:(CCLayer *)layer;
- (void)setLife:(float)damage;

- (Type)getAgile;
- (int)getFlag;
- (void)setFlag:(int)flag;
- (void)skill1:(NSMutableArray *)array;
- (void)skill2:(NSMutableArray *)array;
- (void)skill3:(NSMutableArray *)array;
- (Type)getAttack;
@end
