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
        _layoutArray = [[NSMutableArray alloc] init];
        _wallArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)didLoadFromCCB{
    // init occupation
    _occupation = [[NSArray alloc] initWithObjects:_warrior,_hunter,_paladin,_shaman,_druid,_mage,_priest,_warlock, nil];
    [self initCell];
}
- (void) initCell{
    CCArray *arr = [self children];
    
    for (CCNode *node in arr) {
        if (node.tag == 2) {
            [_wallArray addObject:node];
        }
    }
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch  *touch=[touches anyObject];
    CGPoint  touchLocation= [touch locationInView:[touch view]];
    
    CGPoint  point=[[CCDirector sharedDirector] convertToGL:touchLocation];
    [_occupation enumerateObjectsUsingBlock:^(BaseSprite *sprite, NSUInteger idx, BOOL *stop) {
        CGRect rect = [sprite boundingBox];
        
        if(CGRectContainsPoint(rect, point)){
            stop = _istouch = YES;
            _moveSprite = [sprite copyWithSelf:self];
        }
        
    }];
    
    [_layoutArray enumerateObjectsUsingBlock:^(BaseSprite *sprite, NSUInteger idx, BOOL *stop) {
        CGRect rect = [sprite boundingBox];
        
        if(CGRectContainsPoint(rect, point)){
            stop = _istouch = YES;
            _moveSprite = sprite;
            
        }
    }];
    [_layoutArray removeObject:_moveSprite];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!_istouch) {
        return;
    }
    UITouch  *touch=[touches anyObject];
    CGPoint  touchLocation= [touch locationInView:[touch view]];
    CGPoint  point=[[CCDirector sharedDirector] convertToGL:touchLocation];
    [_moveSprite setPosition:point];
    [_wallArray enumerateObjectsUsingBlock:^(CCSprite *obj, NSUInteger idx, BOOL *stop) {
        CGRect r = [obj boundingBox];
        if(CGRectContainsPoint(r, point)){
            [_moveSprite setPosition:obj.position];
            stop = _isfixed = YES;
        }else{
            
        }
    }];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (_isfixed) {
        [_layoutArray addObject:_moveSprite];
    }else{
        [_layoutArray removeObject:_moveSprite];
        [self removeChild:_moveSprite cleanup:YES];
    }
    //[_moveSprite release];
    _moveSprite = nil;
    _istouch = NO;
    _isfixed = NO;
}

- (void)click:(id)sender{
    MainScene *main = [[MainScene alloc] initWithParams:_layoutArray];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0 scene:main.scene withColor:ccBLACK]];
    [main release];
    
}

- (void)dealloc{
    _occupation = nil;
    [_warrior release];
    [_hunter release];
    [_paladin release];
    [_shaman release];
    [_druid release];
    [_mage release];
    [_priest release];
    [_warlock release];
    //[_occupation release];
    [_moveSprite release];
    [_layoutArray release];
    [_wallArray release];
    [super dealloc];
}

@end
