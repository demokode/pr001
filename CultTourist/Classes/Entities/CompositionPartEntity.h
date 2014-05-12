//
//  CompositionPartEntity.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"
@interface CompositionPartEntity : BaseEntity
{
	
	
}

@property (nonatomic) long compositionRemoteId;
@property (nonatomic, copy) NSString *entityDescription;
@property (nonatomic, copy) NSString *normalImageUrl;
- (id)initWithRemoteId:(long)aRemoteId compositionRemoteId:(long)aCompositionRemoteId name:(NSString*)aName description:(NSString*)aDescription normalImageUrl:(NSString*)aNormalImageUrl;
@end
