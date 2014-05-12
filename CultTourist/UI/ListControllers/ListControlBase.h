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
@property(nonatomic,readonly)NSArray* compositionList;
@property(nonatomic,assign)IBOutlet id<ListControlDelegate>  callback;
/**
 Add composition in to end of list;
 */
-(void)pushList:(NSArray*)compositions;
/**
 */
-(void)clearList;
/**
 Replace exist composition with new list;
 */
-(void)setList:(NSArray*)compositions;

/**
 Called at first move to superview;
 */
-(void)initializeView;

@end
