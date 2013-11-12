//
//  Status.m
//  Cardwow
//
//  Created by rayln on 13-11-10.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Status.h"


@implementation Status

- (id)initWithSizeAndStatus:(CGSize)size Life:(Type)life Energy:(Type)energy{
    if (self = [super init]) {
        self.contentSize = size;
        self.life = life;
        self.rage = energy;
    }
    return self;
}

- (void)draw{
    [self drawLife];
    [self drawPower];
}
- (void)drawLife{
    glLineWidth( 7.0f );
    ccDrawColor4B(81,133,54,255);
    float percent = (float)_life.current/(float)_life.max;
    if (percent > 1) {
        percent = 1;
    }
    ccDrawLine( ccp(0, 3), ccp(self.contentSize.width * percent, 3) );
    
}
- (void)drawPower{
    glLineWidth( 5.0f );
    ccDrawColor4B(0,169,227,255);
    float percent = (float)_rage.current/(float)_rage.max;
    if (percent > 1) {
        percent = 1;
    }
    ccDrawLine( ccp(0, 0), ccp(self.contentSize.width * percent, 0) );
}
@end
