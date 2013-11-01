//
//  MainScene.m
//  Cardwow
//
//  Created by Rayln Guan on 10/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"


@implementation MainScene

- (id)initWithParams:(NSMutableArray *)layoutArray{
    if (self = [super init]) {
        self.scene = [CCBReader sceneWithNodeGraphFromFile:@"MainScene.ccbi"];
        self.isTouchEnabled = YES;
        [self initLayout:layoutArray];
    }
    return self;
}

- (void)initLayout:(NSMutableArray *)layoutArray{
    _spriteArray = [[NSMutableArray alloc] init];
    [_scene addChild:self];
    [layoutArray enumerateObjectsUsingBlock:^(BaseSprite *sprite, NSUInteger idx, BOOL *stop) {
        BaseSprite *s = [[sprite copyWithSelf:self] autorelease];
        [_spriteArray addObject:s];
    }];
}


- (void)click:(id)sender{
    CCScene *scene = [CCBReader sceneWithNodeGraphFromFile:@"Main.ccbi"];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene withColor:ccBLACK]];
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch!!!");
    BaseSprite *base = [_spriteArray objectAtIndex:0];
    [base setLife:20.0f];
}

- (void)dealloc{
    [_scene release];
    [_spriteArray release];
    [super dealloc];
}
@end
