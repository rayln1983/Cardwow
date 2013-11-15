//
//  DK.m
//  Cardwow
//
//  Created by rayln on 13-11-10.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "DK.h"


@implementation DK

- (id)init{
    if (self = [super init]) {
        [self setContentSize:CGSizeMake(199,188)];
        CCSprite *sprite = [CCSprite spriteWithFile:@"class_rogue.jpg"];
        [self addChild:sprite];
        CCSprite *sprite1 = [CCSprite spriteWithFile:@"class_rogue.jpg"];
        sprite1.position = ccp(100, 100);
        [self addChild:sprite1];
    }
    return self;
}
- (void)draw{
    
    glLineWidth( 7.0f );
    ccDrawColor4B(81,133,54,255);
    ccDrawLine( ccp(0, 3), ccp(self.contentSize.width * 1, 3) );
    [super draw];
//    NSLog(@"111");
}
@end
