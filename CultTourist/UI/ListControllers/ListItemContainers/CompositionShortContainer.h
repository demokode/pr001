//
//  CompositionShorContainer.h
//  CultTourist
//
//  Created by DimasSup on 13.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListItemContainerBase.h"
#import "CompositionShortEntity.h"
#import "Constants.h"
/**
 Implementation of ListItemContainerBase for Composition Short entity
 */
@interface CompositionShortContainer : ListItemContainerBase
@property (nonatomic)EControlState downloadState;
@property (nonatomic)EControlState favoriteState;
-(CompositionShortEntity *)realEntity;
@end
