//
//  RestKitManager.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "RestKitManager.h"
#import <RestKit/RestKit.h>
#import "CompositionPartEntity.h"
#import "CompositionPartTrackEntity.h"
@implementation RestKitManager


-(RKObjectMapping*)mappingCompositionEntity
{
	RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[CompositionPartEntity class]];
	[mapping addAttributeMappingsFromDictionary:@{
												  @"id" : @"remoteId",
												  @"name" : @"name",
												  @"desc":@"entityDescription",
												  @"author_name" : @"authorName",
												  @"author_id" : @"authorRemoteId",
												  @"img" : @"normalImageUrl",
												  }];

	return mapping;
}

-(RKObjectMapping*)mappingCompositionPartTrackEntity
{
	RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[CompositionPartTrackEntity class]];
	[mapping addAttributeMappingsFromDictionary:@{
															 @"id" : @"remoteId",
															 @"name" : @"name",
															 @"time":@"duration",
															 @"url" : @"trackUrl",
															 @"parent" : @"partRemoteId"
															 }];

	return mapping;
}

-(RKObjectMapping*)mappingCompositionPartEntity
{
	RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[CompositionPartEntity class]];
	[mapping addAttributeMappingsFromDictionary:@{
															 @"id_parent" : @"compositionRemoteId",
															 @"id" : @"remoteId",
															 @"name" : @"name",
															 @"desc":@"entityDescription",
															 @"img" : @"normalImageUrl",
															 }];
	return mapping;
}

@end
