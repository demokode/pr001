//
//  CompositionPartTrackEntity.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionPartTrackEntity.h"

@implementation CompositionPartTrackEntity
@synthesize partRemoteId = _partRemoteId;

@synthesize duration = _duration;
@synthesize trackUrl = _trackUrl;
- (id)initWithRemoteId:(long)aRemoteId partRemoteId:(long)aPartRemoteId name:(NSString*)aName duration:(double)aDuration trackUrl:(NSString*)aTrackUrl
{
    self = [super initWithRemoteId:aRemoteId name:aName];
    if (self) {
        _partRemoteId = aPartRemoteId;

        _duration = aDuration;
        _trackUrl = [aTrackUrl retain];
    }
    return self;
}


//===========================================================
// dealloc
//===========================================================
- (void)dealloc
{

    [_trackUrl release];
    _trackUrl = nil;
	
    [super dealloc];
}


@end
