//
//  CompositionShortEntity.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "BaseEntity.h"

@interface CompositionMiddleEntity : BaseEntity
{
	
}
@property (nonatomic, retain) NSString *authorName;
@property (nonatomic, retain) NSString *smallImageUrl;
- (id)initWithRomoteId:(long)aRomoteId name:(NSString*)aName authorName:(NSString*)anAuthorName smallImageUrl:(NSString*)aSmallImageUrl;
@end
