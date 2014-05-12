//
//  BaseEntity BaseEntity.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseEntity : NSObject
{
	
}
@property (nonatomic) long remoteId;
@property (nonatomic, retain) NSString *name;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString*)aName;
@end
