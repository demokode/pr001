//
//  CompositionPartTrackEntity.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"
@interface CompositionPartTrackEntity : BaseEntity
{
	
}

@property (nonatomic) long partRemoteId;
@property (nonatomic) double duration;
@property (nonatomic, retain) NSString *trackUrl;
- (id)initWithRemoteId:(long)aRemoteId partRemoteId:(long)aPartRemoteId name:(NSString*)aName duration:(double)aDuration trackUrl:(NSString*)aTrackUrl;

@end
