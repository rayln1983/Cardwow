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
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch  *touch=[touches anyObject];
    CGPoint  touchLocation= [touch locationInView:[touch view]];
    
    CGPoint  glLocation=[[CCDirector sharedDirector] convertToGL:touchLocation];
    NSLog(@"%f,%f", glLocation.x, glLocation.y);
    
    [_warrior boundingBox];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"end");
}
@end
