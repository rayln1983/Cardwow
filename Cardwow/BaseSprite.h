//
//  BaseSprite.h
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Util.h"
#import "Status.h"
#define INIT_LIFE_COLOR ccDrawColor4B(81,133,54,255)
#define INIT_POWER_COLOR ccDrawColor4B(0,169,227,255)

@interface BaseSprite : CCNode {
    int _flag;
    int _row;
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
    
    CCLabelTTF *_point;
}
//@property (nonatomic, assign) Type agile;
@property (nonatomic, retain) CCLabelTTF *point;

- (id)copyWithSelf;
- (BOOL)setLife:(int)damage;


- (int)getFlag;
- (void)setFlag:(int)flag;
- (int)getRow;
- (void)setRow:(int)row;
- (void)skill1:(NSMutableArray *)array :(CCLayer *)layer;
- (void)skill2:(NSMutableArray *)array :(CCLayer *)layer;
- (void)skill3:(NSMutableArray *)array :(CCLayer *)layer;
- (void)skilltest:(NSMutableArray *)array :(NSMutableArray *)layer :(SEL)selector;
- (BOOL)setLife:(int)damage :(NSMutableArray *)array :(CCLayer *)layer;
- (void)setDamageFont:(int)damage :(CCLayer *)layer;
- (void)initElements:(CGPoint)point :(CCSprite *)sprite :(Status *)status;
- (Type)getAttack;
- (Type)getLife;
- (Type)getMagicAttack;
- (Type)getAgile;
- (void)setAgile:(int)agile;
- (void)initFontLayout:(CGPoint)point;
@end
