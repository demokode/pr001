//
//  ListTableCellBase.m
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListTableCellBase.h"

@implementation ListTableCellBase

@synthesize container = _container;
@synthesize slideController = _slideController;
-(UIView *)topView
{
	
	return nil;
}
-(UIView*)actionPanel
{
	return nil;
}
- (void)awakeFromNib
{
	self.slideController.isAllowActionPanel = YES;

}


-(void)initializeWithItemContainer:(ListItemContainerBase *)container
{
	if(_container!=container)
	{
		[_container release];
		_container = [container retain];
	}
}
-(ListItemContainerBase *)realItemContainer
{
	return _container;
}
#pragma mark  - Slide controller delegate
-(void)topViewWillHide:(SlideControllerView *)slideController
{
	
}
-(void)topViewWillOpen:(SlideControllerView *)slideController
{
	
}

#pragma mark -


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}

-(void)dealloc
{
	[_slideController release];
	[super dealloc];
}

@end
