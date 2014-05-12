//
//  AuthorShortEntity.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "BaseEntity.h"

@interface AuthorShortEntity : BaseEntity
{
	
}
@property (nonatomic, retain) NSString *lastName;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString*)aName lastName:(NSString*)aLastName;
@end
