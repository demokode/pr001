//
//  CompositionShortEntity.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionMiddleEntity.h"

@implementation CompositionMiddleEntity
@synthesize authorName = _authorName;
@synthesize smallImageUrl = _smallImageUrl;
- (id)initWithRomoteId:(long)aRomoteId name:(NSString*)aName authorName:(NSString*)anAuthorName smallImageUrl:(NSString*)aSmallImageUrl
{
    self = [super initWithRemoteId:aRomoteId name:aName];
    if (self) {

        _authorName = [anAuthorName retain];
        _smallImageUrl = [aSmallImageUrl retain];
    }
    return self;
}


//===========================================================
// dealloc
//===========================================================
- (void)dealloc
{
    [_authorName release];
    _authorName = nil;
    [_smallImageUrl release];
    _smallImageUrl = nil;
	
    [super dealloc];
}


@end
