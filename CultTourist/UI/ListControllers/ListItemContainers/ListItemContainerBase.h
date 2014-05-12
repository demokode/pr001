//
//  ListItemContainerBase.h
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"
/**
 Base class which contain temp information for represent cells in list;
 */
@interface ListItemContainerBase : NSObject
@property(nonatomic,retain)BaseEntity* baseEntity;
-(NSString*)identifier;
-(BaseEntity*)realEntity;
@end
