//
//  AuthorEntity.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "AuthorEntity.h"

@implementation AuthorEntity
@synthesize lastName = _lastName;
@synthesize birthDate = _birthDate;
@synthesize deathDate = _deathDate;
@synthesize normalImageUrl = _normalImageUrl;
@synthesize entityDescription = _entityDescription;
@synthesize compositionShorts = _compositionShorts;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString*)aName lastName:(NSString*)aLastName birthDate:(NSDate*)aBirthDate deathDate:(NSDate*)aDeathDate normalImageUrl:(NSString*)aNormalImageUrl description:(NSString*)aDescription compositionShorts:(NSArray*)aCompositionShorts
{
    self = [super initWithRemoteId:aRemoteId name:aName];
    if (self) {

        _lastName = [aLastName retain];
        _birthDate = [aBirthDate retain];
        _deathDate = [aDeathDate retain];
        _normalImageUrl = [aNormalImageUrl retain];
        _entityDescription = [aDescription retain];
        _compositionShorts = [aCompositionShorts retain];
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
    [_birthDate release];
    _birthDate = nil;
    [_deathDate release];
    _deathDate = nil;
    [_normalImageUrl release];
    _normalImageUrl = nil;
    [_entityDescription release];
    _entityDescription = nil;
    [_compositionShorts release];
    _compositionShorts = nil;
	
    [super dealloc];
}


@end
