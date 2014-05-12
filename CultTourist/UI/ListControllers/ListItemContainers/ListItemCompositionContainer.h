//
//  ListItemCompositionContainer.h
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListItemContainerBase.h"
#import "CompositionMiddleEntity.h"
#import "Constants.h"

/**
 Implementation of ListItemContainerBase for Composition entity
 */
@interface ListItemCompositionContainer : ListItemContainerBase
@property (nonatomic)EControlState downloadState;
@property (nonatomic)EControlState favoriteState;
-(CompositionMiddleEntity *)realEntity;


@end
