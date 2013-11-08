//
//  MainScene.m
//  Cardwow
//
//  Created by Rayln Guan on 10/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"
typedef struct {
    int index;
    int type;
} GroupType;

@implementation MainScene

- (id)initWithParams:(NSMutableArray *)layoutArray{
    if (self = [super init]) {
        self.scene = [CCBReader sceneWithNodeGraphFromFile:@"MainScene.ccbi"];
        self.isTouchEnabled = YES;
        [self initButton];
        [self initLayout:layoutArray];
    }
    return self;
}

- (void)initButton{
    _startButton = [[CCSprite alloc] initWithFile:@"menustart.png"];
    [_startButton setPosition:ccp(160, 240)];
    [self addChild:_startButton];
    
}

- (void)initLayout:(NSMutableArray *)layoutArray{
    _groupA = [[NSMutableArray alloc] initWithObjects: [[[NSMutableArray alloc] init] autorelease], [[[NSMutableArray alloc] init] autorelease], [[[NSMutableArray alloc] init] autorelease], nil];
    _groupB = [[NSMutableArray alloc] initWithObjects: [[[NSMutableArray alloc] init] autorelease], [[[NSMutableArray alloc] init] autorelease], [[[NSMutableArray alloc] init] autorelease], nil];
    
    _groupALayout = [[NSArray alloc] initWithObjects: [[NSNumber numberWithFloat:328.0f] autorelease], [[NSNumber numberWithFloat:388.0f] autorelease],[[NSNumber numberWithFloat:448.0f] autorelease], nil];
    _groupBLayout = [[NSArray alloc] initWithObjects: [[NSNumber numberWithFloat:152.0f] autorelease], [[NSNumber numberWithFloat:92.0f] autorelease],[[NSNumber numberWithFloat:32.0f] autorelease], nil];
    [_scene addChild:self];
    [layoutArray enumerateObjectsUsingBlock:^(BaseSprite *sprite, NSUInteger idx, BOOL *stop) {
        BaseSprite *s = [[sprite copyWithSelf:self] autorelease];
        NSLog(@"positon: %f, %f", s.position.x, s.position.y);
        GroupType type = [self getIndex:s.position.y];
        NSLog(@"====%i, %i", type.index, type.type);
        [s setFlag:type.type];
        if (type.type == 0) {
            NSMutableArray *array = [_groupA objectAtIndex:type.index];
            [array addObject:s];
        }else{
            NSMutableArray *array = [_groupB objectAtIndex:type.index];
            [array addObject:s];
        }
        //[_spriteArray addObject:s];
    }];
    NSLog(@"_groupA: %@", _groupA);
    NSLog(@"_groupB: %@", _groupB);
}

- (GroupType)getIndex:(float)y{
    GroupType t;
    for (int i = 0; i < [_groupALayout count]; i++) {
        NSNumber *num = [_groupALayout objectAtIndex:i];
        if ([num floatValue] == y) {
            t.index = i;
            t.type = 0;
            return t;
        }
    }
    for (int i = 0; i < [_groupBLayout count]; i++) {
        NSNumber *num = [_groupBLayout objectAtIndex:i];
        if ([num floatValue] == y) {
            t.index = i;
            t.type = 1;
            return t;
        }
    }
    return t;
}


- (void)click:(id)sender{
    CCScene *scene = [CCBReader sceneWithNodeGraphFromFile:@"Main.ccbi"];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene withColor:ccBLACK]];
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //BaseSprite *base = [_spriteArray objectAtIndex:0];
    //[base setLife:20.0f];
    
    UITouch  *touch=[touches anyObject];
    CGPoint  touchLocation= [touch locationInView:[touch view]];
    CGPoint  point=[[CCDirector sharedDirector] convertToGL:touchLocation];
    
    if([self isTouchObject:point :_startButton]){
//        [self startWar];
//        [NSThread detachNewThreadSelector:@selector(thread) toTarget:self withObject:nil];
        [self scheduleOnce:@selector(startWar) delay:0];
        
    }
}

- (void)startWar{
    
    for (int i = 0; i < 3; i++) {
        NSMutableArray *groupATemp = [_groupA objectAtIndex:i];
        NSMutableArray *groupBTemp = [_groupB objectAtIndex:i];
        NSArray *newArr = [groupATemp arrayByAddingObjectsFromArray:groupBTemp];
        NSArray *sortArr = [newArr sortedArrayUsingComparator:^NSComparisonResult(BaseSprite *obj1, BaseSprite *obj2) {
            int agile1 = [obj1 getAgile].current;
            int agile2 = [obj2 getAgile].current;
            if (agile1 > agile2) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            
            if (agile1 < agile2) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            return (NSComparisonResult)NSOrderedSame;
            
        }];
        NSMutableArray *sortMutArr = [[NSMutableArray alloc] initWithArray:sortArr];
//        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"agile" ascending:NO];
//        NSArray *sortArr = [newArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sort,nil]];

        SEL selector = NSSelectorFromString([NSString stringWithFormat:@"skill%i::", (i+1)]);
        for (BaseSprite *sprite in sortArr) {
            if ([sprite getLife].current > 0) {
                if (sprite.getFlag == 0) {
                    [sprite performSelector:selector withObject:groupBTemp withObject:self];
                    
//                    [sprite skilltest:groupBTemp :self :@selector(test::)];
                }else{
                    [sprite performSelector:selector withObject:groupATemp withObject:self];
  //                  [sprite skilltest:groupATemp :self :@selector(test::)];
                }
            }
            
        }
//        NSMutableArray *params = [[NSMutableArray alloc]initWithObjects:groupBTemp,groupATemp,sortMutArr,self, nil];
//        [self fight:nil :params];
        NSLog(@"_groupA:%@", _groupA);
        NSLog(@"_groupB:%@", _groupB);
    }
}
- (void)test:(id)sender :(NSString *)data{
    NSLog(@"test!!!%@",data);
}

- (void)fight:(id)sender :(NSMutableArray *) params{
    NSMutableArray *sortMutArr = [params objectAtIndex:2];
    int count = [sortMutArr count];
    NSLog(@"%i",count);
    if (count == 0 ) {
        return;
    }
    BaseSprite *sprite = [sortMutArr objectAtIndex:(count-1)];
    if ([sprite getLife].current > 0) {
        if (sprite.getFlag == 0) {
            [sprite skilltest:[params objectAtIndex:0] :params :@selector(fight::)];
        }else{
            [sprite skilltest:[params objectAtIndex:1] :params :@selector(fight::)];
        }
    }
}
- (bool)isTouchObject:(CGPoint) point :(CCSprite *)sprite{
    CGRect rect = [sprite boundingBox];
    return CGRectContainsPoint(rect, point);
}

- (void)dealloc{
    [_scene release];
    [_groupA release];
    [_groupB release];
    [_groupALayout release];
    [_groupBLayout release];
    [_startButton release];
    [super dealloc];
}
@end
