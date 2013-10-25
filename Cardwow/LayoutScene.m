//
//  LayoutScene.m
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "LayoutScene.h"


@implementation LayoutScene

- (id)init{
    if (self = [super init]) {
        NSLog(@"==========================");
    }
    return self;
}

- (void)didLoadFromCCB{
    // init occupation
    _occupation = [[NSArray alloc] initWithObjects:_warrior,_hunter,_paladin,_shaman,_druid,_mage,_priest,_warlock, nil];
    
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch  *touch=[touches anyObject];
    CGPoint  touchLocation= [touch locationInView:[touch view]];
    
    CGPoint  point=[[CCDirector sharedDirector] convertToGL:touchLocation];
    [_occupation enumerateObjectsUsingBlock:^(BaseSprite *sprite, NSUInteger idx, BOOL *stop) {
        CGRect rect = [sprite boundingBox];
        
        if(CGRectContainsPoint(rect, point)){
            stop = _istouch = YES;
        }
        
    }];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!_istouch) {
        return;
    }
    UITouch  *touch=[touches anyObject];
    CGPoint  touchLocation= [touch locationInView:[touch view]];
    CGPoint  point=[[CCDirector sharedDirector] convertToGL:touchLocation];
    
    NSLog(@"%f, %f", point.x, point.y);
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"end");
    _istouch = NO;
}
@end
