//
//  CompositionEntity.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionEntity.h"

@implementation CompositionEntity

@synthesize entityDescription = _entityDescription;
@synthesize authorName = _authorName;
@synthesize authorRemoteId = _authorRemoteId;
@synthesize normalImageUrl = _normalImageUrl;
@synthesize parts = _parts;
@synthesize tracks = _tracks;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString*)aName description:(NSString*)aDescription authorName:(NSString*)anAuthorName authorRemoteId:(long)anAuthorRemoteId normalImageUrl:(NSString*)aNormalImageUrl parts:(NSArray*)aParts tracks:(NSArray*)aTracks
{
    self = [super initWithRemoteId:aRemoteId name:aName];
    if (self) {
       
        _entityDescription = [aDescription retain];
        _authorName = [anAuthorName retain];
        _authorRemoteId = anAuthorRemoteId;
        _normalImageUrl = [aNormalImageUrl retain];
        _parts = [aParts retain];
        _tracks = [aTracks retain];
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
    [_authorName release];
    _authorName = nil;
    [_normalImageUrl release];
    _normalImageUrl = nil;
    [_parts release];
    _parts = nil;
    [_tracks release];
    _tracks = nil;
	
    [super dealloc];
}


@end
