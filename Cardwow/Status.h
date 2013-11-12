//
//  Status.h
//  Cardwow
//
//  Created by rayln on 13-11-10.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef struct {
    int current;
    int max;
} Type;

@interface Status : CCSprite {
    
}
@property (nonatomic, assign) Type life;
@property (nonatomic, assign) Type energy;
@property (nonatomic, assign) Type rage;
@property (nonatomic, assign) Type power;

- (id)initWithSize:(CGSize)size;
- (id)initWithSizeAndStatus:(CGSize)size Life:(Type)life Energy:(Type)energy;
@end
