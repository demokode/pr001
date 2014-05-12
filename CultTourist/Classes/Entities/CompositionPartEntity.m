//
//  CompositionPartEntity.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionPartEntity.h"

@implementation CompositionPartEntity

@synthesize compositionRemoteId = _compositionRemoteId;

@synthesize entityDescription = _entityDescription;
@synthesize normalImageUrl = _normalImageUrl;
- (id)initWithRemoteId:(long)aRemoteId compositionRemoteId:(long)aCompositionRemoteId name:(NSString*)aName description:(NSString*)aDescription normalImageUrl:(NSString*)aNormalImageUrl
{
    self = [super initWithRemoteId:aRemoteId name:aName];
    if (self)
	{
        _compositionRemoteId = aCompositionRemoteId;
        _entityDescription = [aDescription retain];
        _normalImageUrl = [aNormalImageUrl retain];
    }
    return self;
}


//===========================================================
// dealloc
//===========================================================
- (void)dealloc
{

    [_entityDescription release];
    _entityDescription = nil;
    [_normalImageUrl release];
    _normalImageUrl = nil;
	
    [super dealloc];
}



@end
