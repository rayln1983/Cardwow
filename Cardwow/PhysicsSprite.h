//
//  PhysicsSprite.h
//  Cardwow
//
//  Created by rayln on 13-10-23.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import "cocos2d.h"
#import "chipmunk.h"

@interface PhysicsSprite : CCSprite
{
	cpBody *body_;	// strong ref
}

-(void) setPhysicsBody:(cpBody*)body;

@end