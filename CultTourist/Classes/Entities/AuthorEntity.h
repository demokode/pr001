//
//  AuthorEntity.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "BaseEntity.h"

@interface AuthorEntity : BaseEntity
{
	
}
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSDate *birthDate;
@property (nonatomic, retain) NSDate *deathDate;
@property (nonatomic, retain) NSString *normalImageUrl;
@property (nonatomic, retain) NSString *entityDescription;
@property (nonatomic, retain) NSArray *compositionShorts;
- (id)initWithRemoteId:(long)aRemoteId name:(NSString*)aName lastName:(NSString*)aLastName birthDate:(NSDate*)aBirthDate deathDate:(NSDate*)aDeathDate normalImageUrl:(NSString*)aNormalImageUrl description:(NSString*)aDescription compositionShorts:(NSArray*)aCompositionShorts;
@end
