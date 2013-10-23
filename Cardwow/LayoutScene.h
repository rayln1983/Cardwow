//
//  LayoutScene.h
//  Cardwow
//
//  Created by rayln on 13-10-24.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Warrior.h"
#import "Hunter.h"
#import "Paladin.h"
#import "Shaman.h"
#import "Druid.h"
#import "Mage.h"
#import "Priest.h"
#import "Warlock.h"

@interface LayoutScene : CCLayer {
    
}
@property (nonatomic, strong) Warrior *warrior;
@property (nonatomic, strong) Hunter *hunter;
@property (nonatomic, strong) Paladin *paladin;
@property (nonatomic, strong) Shaman *shaman;
@property (nonatomic, strong) Druid *druid;
@property (nonatomic, strong) Mage *mage;
@property (nonatomic, strong) Priest *priest;
@property (nonatomic, strong) Warlock *warlock;
@end
