//
//  Util.m
//  Cardwow
//
//  Created by rayln on 13-11-8.
//
//

#import "Util.h"

@implementation Util

+ (int)random:(int)min :(int)max{
    return rand()%(max - min + 1) + min;
}
@end
