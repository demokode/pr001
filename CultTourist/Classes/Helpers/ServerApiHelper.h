//
//  ServerApiHelper.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CompositionEntity;
@class AuthorEntity;
@interface ServerApiHelper : NSObject
{
	NSMutableDictionary* _activeRequests;
}
+(ServerApiHelper *) sharedServerApiHelper;
-(int)requestPopulars:(void (^)(NSArray* middleCompositionInfos))success failed:(void (^)(NSError* error))failed;
-(int)requestCompositionById:(long)compositionId  success:(void (^)(CompositionEntity* middleCompositionInfo))success failed:(void (^)(NSError* error))failed;
-(int)requestAuthorById:(long)authorId success:(void (^)(AuthorEntity* middleCompositionInfo))success failed:(void (^)(NSError* error))failed;
@end
