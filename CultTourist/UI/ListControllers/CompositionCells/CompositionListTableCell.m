//
//  CompositionListTableCell.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionListTableCell.h"
#import "SkinProvider.h"
@implementation CompositionListTableCell
-(UIView *)topView
{
	return _mainView;
}
-(UIView *)actionPanel
{
	return _actionPanel;
}
- (void)awakeFromNib
{
	
	self.selectionStyle = UITableViewCellSelectionStyleNone;
	[[SkinProvider sharedSkinProvider] applyDefaultFontToLabel:_titleLabel size:18];
	[[SkinProvider sharedSkinProvider] applyDefaultFontToLabel:_descriptionLabel size:13];
	
	
 	[_actionPanel setDownloadState:EControlState_On];
	[_actionPanel setFavoriteState:EControlState_Disable];
	self.slideController.actionPanelSide = EActionPanelSide_Left;
	[super awakeFromNib];
}
-(ListItemCompositionContainer *)realItemContainer
{
	return (ListItemCompositionContainer*)_container;
}
-(void)initializeWithItemContainer:(ListItemCompositionContainer *)container
{
	[super initializeWithItemContainer:container];
	
	_titleLabel.text = container.realEntity.name;
	_descriptionLabel.text = container.realEntity.authorName;
	[_actionPanel setDownloadState:container.downloadState];
	[_actionPanel setFavoriteState:container.favoriteState];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}
#pragma mark - Action panel delegate
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
	[_mainView release];
	[_titleLabel release];
	[_descriptionLabel release];
	[_iconImage release];

	[super dealloc];
}

@end
