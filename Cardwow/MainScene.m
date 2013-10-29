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
        self.layoutArray = layoutArray;
        [self initLayout];
    }
    return self;
}

- (void)initLayout{
    [_scene addChild:self];
    [_layoutArray enumerateObjectsUsingBlock:^(BaseSprite *sprite, NSUInteger idx, BOOL *stop) {
        [sprite copyWithSelf:self];
    }];
}


- (void)click:(id)sender{
    CCScene *scene = [CCBReader sceneWithNodeGraphFromFile:@"Main.ccbi"];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene withColor:ccBLACK]];
    
}
- (void)dealloc{
    [_scene release];
    [_layoutArray release];
    [super dealloc];
}
@end
