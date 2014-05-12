//
//  AuthorShortEntity.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "AuthorShortEntity.h"

@implementation AuthorShortEntity
@synthesize lastName = _lastName;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString*)aName lastName:(NSString*)aLastName
{
    self = [super initWithRemoteId:aRemoteId name:aName];
    if (self) {
        _lastName = [aLastName retain];
    }
    return self;
}


//===========================================================
// dealloc
//===========================================================
- (void)dealloc
{

    [_lastName release];
    _lastName = nil;
	
    [super dealloc];
}


@end
