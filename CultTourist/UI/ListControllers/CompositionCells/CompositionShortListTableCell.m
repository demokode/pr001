//
//  CompositionShortListTableCell.m
//  CultTourist
//
//  Created by DimasSup on 13.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionShortListTableCell.h"
#import "SkinProvider.h"
@implementation CompositionShortListTableCell
#pragma mark - Initialization logic

- (void)awakeFromNib
{
  	self.selectionStyle = UITableViewCellSelectionStyleNone;
	[[SkinProvider sharedSkinProvider] applyDefaultFontToLabel:_titleLabel size:18];
	
	
 	[_actionPanel setDownloadState:EControlState_On];
	[_actionPanel setFavoriteState:EControlState_Disable];
	self.slideController.actionPanelSide = EActionPanelSide_Left;
	[super awakeFromNib];
}
-(void)initializeWithItemContainer:(CompositionShortContainer *)container
{
	[super initializeWithItemContainer:container];
	
	_titleLabel.text = container.realEntity.name;
	[_actionPanel setDownloadState:container.downloadState];
	[_actionPanel setFavoriteState:container.favoriteState];
}

-(CompositionShortContainer *)realItemContainer
{
	return (CompositionShortContainer*)_container;
}

#pragma mark - Implement action panel avent (add to favorite/download)
-(BOOL)onDownloadClicked:(ActionDownloadFavoriteView *)view
{
	[self realItemContainer].downloadState = EControlState_On;
	
	return YES;
}
-(BOOL)onFavoriteClicked:(ActionDownloadFavoriteView *)view
{
	[self realItemContainer].favoriteState = EControlState_On;
	
	return YES;
}

#pragma mark -

-(void)dealloc
{

	[_actionPanel release];
	[_titleLabel release];
	
	[super dealloc];
}

@end
