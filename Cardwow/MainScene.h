//
//  MainScene.h
//  Cardwow
//
//  Created by Rayln Guan on 10/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBReader.h"
#import "Warrior.h"
#import "Hunter.h"
#import "Paladin.h"
#import "Shaman.h"
#import "Druid.h"
#import "Mage.h"
#import "Priest.h"
#import "Warlock.h"
#import "MainScene.h"

@interface MainScene : CCLayer {
    
}
@property (nonatomic, strong) CCScene *scene;
@property (nonatomic, strong) NSMutableArray *groupA;
@property (nonatomic, strong) NSMutableArray *groupB;
@property (nonatomic, strong) NSArray *groupALayout;
@property (nonatomic, strong) NSArray *groupBLayout;
@property (nonatomic, strong) CCSprite *startButton;
@property (nonatomic, assign) int attackGroup;
@property (nonatomic, strong) NSMutableArray *groupAPosition;
@property (nonatomic, strong) NSMutableArray *groupBPosition;

- (id) initWithParams:(NSMutableArray *)layoutArray;
- (void)test:(id)sender;
@end
