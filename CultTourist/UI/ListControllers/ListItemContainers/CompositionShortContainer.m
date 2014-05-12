//
//  CompositionShorContainer.m
//  CultTourist
//
//  Created by DimasSup on 13.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionShortContainer.h"

@implementation CompositionShortContainer
@synthesize downloadState  = _downloadState;
@synthesize favoriteState = _favoriteState;

-(NSString *)identifier
{
	return @"scomp";
}
-(CompositionShortEntity *)realEntity
{
	return (CompositionShortEntity *)self.baseEntity;
}
@end
