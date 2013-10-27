//
//  BaseSprite.h
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
typedef struct {
    int current;
    int max;
} Type;

@interface BaseSprite : CCSprite <NSCopying> {
    
}
//life
@property (nonatomic,assign) Type life;
//power
@property (nonatomic,assign) Type power;
@property (nonatomic,assign) Type armor;
@property (nonatomic,assign) Type defense;

- (id)copyWithSelf:(CCLayer *)layer;
@end
