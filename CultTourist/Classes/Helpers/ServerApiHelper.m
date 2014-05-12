//
//  ServerApiHelper.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ServerApiHelper.h"
#import "UrlsManager.h"
#import <RestKit/RestKit.h>
#import "CompositionMiddleEntity.h"
#import "CompositionEntity.h"
#import "CompositionPartEntity.h"
#import "CompositionPartTrackEntity.h"
static ServerApiHelper *sharedServerApiHelperInstance = nil;




@implementation ServerApiHelper
+(ServerApiHelper *) sharedServerApiHelper
{
    @synchronized(self) {
        if (sharedServerApiHelperInstance == nil) {
            sharedServerApiHelperInstance = [[self alloc] init];
        }
        return sharedServerApiHelperInstance;
    }
}

-(id)init
{
	self = [super init];
	if(self)
	{
		_activeRequests = [NSMutableDictionary new];
	}
	return self;
	
}


-(int)requestPopulars:(void (^)(NSArray* middleCompositionInfos))success failed:(void (^)(NSError* error))failed
{

	dispatch_async(dispatch_get_main_queue(), ^{
		NSMutableArray* result = [NSMutableArray new];
		for (int i = 0; i<30;i++ ) {
			CompositionMiddleEntity* entity = [[CompositionMiddleEntity alloc] initWithRomoteId:i+1 name:[NSString stringWithFormat:@"Composition  - %i",i] authorName:@"UTHOR!" smallImageUrl:@""];
			[result addObject:entity];
			[entity release];
		}
		success(result);
		[result release];
		

	});
	return 0;
}
-(int)requestCompositionById:(long)compositionId  success:(void (^)(CompositionEntity* middleCompositionInfo))success failed:(void (^)(NSError* error))failed
{
	dispatch_async(dispatch_get_main_queue(), ^{
		CompositionEntity* entity = [[CompositionEntity alloc] initWithRemoteId:compositionId name:[NSString stringWithFormat:@"Composition - %li",compositionId-1]];
		entity.authorRemoteId = 1;
		entity.authorName = @"Пушкин";
		entity.entityDescription = @"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat";
		entity.normalImageUrl = @"";
		NSMutableArray* parts = [NSMutableArray new];
		NSMutableArray* tracks = [NSMutableArray new];
		for (int i = 0; i<20; i++)
		{
			CompositionPartEntity* part = [CompositionPartEntity new];
			part.remoteId = i*100+3000;
			part.name = [NSString stringWithFormat:@"Part № - %i",i];
			part.compositionRemoteId = compositionId;
			part.entityDescription = [NSString stringWithFormat:@"Part %i of %@",i,entity.name];
			
			for (int  i2 = 0; i2<6; i2++)
			{
				CompositionPartTrackEntity* track = [CompositionPartTrackEntity new];
				track.remoteId = part.remoteId+i2;
				track.name =[NSString stringWithFormat:@"Track  #%i",i2];
				track.duration = 3*60;
				track.trackUrl = @"http://cs9-2v4.vk.me/p7/6d92c6d83bac31.mp3";
				[tracks addObject:track];
				[track release];
			}
			[parts addObject:part];
			[part release];
		}
		entity.tracks = tracks;
		entity.parts = parts;
		[tracks release];
		[parts release];
		success(entity);
		[entity release];
		
	});
	return 0;
}





@end
