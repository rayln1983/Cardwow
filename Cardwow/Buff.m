//
//  Buff.m
//  Cardwow
//
//  Created by rayln on 13-11-14.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Buff.h"


@implementation Buff

- (id)initWithBuff:(NSString *)icon :(int)duration :(int)type :(int)row{
    if (self = [super init]) {
        _icon = [CCSprite spriteWithFile:icon];
        _duration = duration;
        _value = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i",duration] fontName:@"Marker Felt" fontSize:15 ];
        _nType = type;
        _row = row;
        
        [_icon setAnchorPoint:ccp(0, 1)];
        [_value setAnchorPoint:ccp(.5, 1)];
        [_value setPosition:ccp(12, -4)];
        
        [self setContentSize:CGSizeMake(24, 24)];
        [self setAnchorPoint:ccp(0, 0)];
        [self addChild:_icon];
        [self addChild:_value];
//        [self scheduleUpdate];
    }
    return self;
}
- (void)move:(CGPoint)position{
    CCScaleTo *action1 = [CCScaleTo actionWithDuration:.2 scale:.5];
    CCMoveTo *action2 = [CCMoveTo actionWithDuration:.2 position:position];
    CCSequence *seq = [CCSequence actions:action1, action2, nil];
    //    [self runAction:action1];
    //    [self runAction:action2];
    [self runAction:seq];
}
- (void)updateStatus{
    NSLog(@"======%i====",_duration);
    [_value setString:[NSString stringWithFormat:@"%i",_duration]];
}


@end
