//
//  BaseEntity.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity
@synthesize remoteId = _remoteId;
@synthesize name = _name;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString *)aName
{
    self = [super init];
    if (self)
	{
        _remoteId = aRemoteId;
		_name = [aName retain];
    }
    return self;
}


//===========================================================
// dealloc
//===========================================================
- (void)dealloc
{
	
	[_name release];
	_name = nil;
	[super dealloc];
}

-(NSString *)description
{
	return [NSString stringWithFormat:@"{BaseEntity: remoteId = %li , name = %@", _remoteId, _name];
}


@end
