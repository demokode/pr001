//
//  CompositionListControl.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseEntity;
@class ListControlBase;
@protocol ListControlDelegate <NSObject>

-(void)onSelectItem:(BaseEntity*)selectedEntity onList:(ListControlBase*)listControl;

@end

@interface ListControlBase : UIView
{
	@protected
	BOOL _isAlreadyInitialize;
}
/**
Items in containers;
 */
@property(nonatomic,readonly)NSArray* itemsList;
@property(nonatomic,assign)IBOutlet id<ListControlDelegate>  callback;
/**
 Add items in to end of list;
 */
-(void)pushList:(NSArray*)compositions;
/**
 */
-(void)clearList;
/**
 Replace exist items with new list;
 */
-(void)setList:(NSArray*)compositions;

/**
 Called at first move to superview;
 */
-(void)initializeView;

@end
