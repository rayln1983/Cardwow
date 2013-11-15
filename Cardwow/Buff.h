//
//  Buff.h
//  Cardwow
//
//  Created by rayln on 13-11-14.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Buff : CCNode {
    
}
@property (nonatomic, strong) CCSprite *icon;
@property (nonatomic, assign) int duration;
@property (nonatomic, strong) CCLabelTTF *value;
//0: 治疗量为0
@property (nonatomic, assign) int nType;
@property (nonatomic, assign) int row;

- (id)initWithBuff:(NSString *)icon :(int)duration :(int)type :(int)row;
- (void)move:(CGPoint)position;
- (void)updateStatus;
@end
