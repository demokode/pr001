//
//  ListItemCompositionContainer.m
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListItemCompositionContainer.h"

@implementation ListItemCompositionContainer
@synthesize downloadState  = _downloadState;
@synthesize favoriteState = _favoriteState;

-(NSString *)identifier
{
	return @"comp";
}
-(CompositionMiddleEntity *)realEntity
{
	return (CompositionMiddleEntity*)self.baseEntity;
}

@end
