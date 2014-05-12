//
//  CompositionEntity.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"
@interface CompositionEntity : BaseEntity
{
	
}

@property (nonatomic, retain) NSString *entityDescription;
@property (nonatomic, retain) NSString *authorName;
@property (nonatomic) long authorRemoteId;
@property (nonatomic, retain) NSString *normalImageUrl;
@property (nonatomic, retain) NSArray *parts;
@property (nonatomic, retain) NSArray *tracks;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString*)aName description:(NSString*)aDescription authorName:(NSString*)anAuthorName authorRemoteId:(long)anAuthorRemoteId normalImageUrl:(NSString*)aNormalImageUrl parts:(NSArray*)aParts tracks:(NSArray*)aTracks;

@end
