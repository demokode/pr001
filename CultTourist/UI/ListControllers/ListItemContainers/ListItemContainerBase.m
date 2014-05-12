//
//  ListItemContainerBase.m
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListItemContainerBase.h"

@implementation ListItemContainerBase
@synthesize baseEntity = _baseEntity;
-(BaseEntity *)realEntity
{
	return _baseEntity;
}
-(NSString *)identifier
{
	return @"base";
}
-(void)dealloc
{
	[_baseEntity release];
	[super dealloc];
}
@end
