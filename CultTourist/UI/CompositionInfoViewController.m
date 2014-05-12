//
//  CompositionInfoViewController.m
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionInfoViewController.h"
#import "SkinProvider.h"
#import "ServerApiHelper.h"
#import "AuthorViewController.h"
@interface CompositionInfoViewController ()

@end

@implementation CompositionInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil andCompositionMiddleEntity:(CompositionMiddleEntity *)entity
{
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    if (self) {
		_compositionMiddleEntity = [entity retain];
    }
    return self;
}

- (void)viewDidLoad
{
	self.barColor =  [[SkinProvider sharedSkinProvider] colorForCompositionBar];
	self.titleColor = [[SkinProvider sharedSkinProvider] colorForTab:ELeftSideMenuTypes_History];
	
    [super viewDidLoad];
	

	self.title = NSLocalizedString(@"Произведение", @"Произведение");
	
	
	
	
	_compositionSlideController.actionPanelSide = EActionPanelSide_Left;
	_compositionSlideController.isAllowActionPanel =YES;
	[[SkinProvider sharedSkinProvider] applyDefaultFontToLabel:_titleLabel size:18];
	[[SkinProvider sharedSkinProvider] applyDefaultFontToLabel:_subtitleLabel size:13];
	_titleLabel.text = _compositionMiddleEntity.name;
	_subtitleLabel.text = _compositionMiddleEntity.authorName;
	
	[[ServerApiHelper sharedServerApiHelper] requestCompositionById:_compositionMiddleEntity.remoteId success:^(CompositionEntity *middleCompositionInfo) {
		_compositionFullyEntity = [middleCompositionInfo retain];
		[self fillInfos];
	} failed:^(NSError *error) {
		
	}];
	UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapAuthorView:)];
	[_authorRootView addGestureRecognizer:tapGesture];
	[tapGesture release];
	
    // Do any additional setup after loading the view from its nib.
}

#pragma mark -
-(void)topViewWillOpen:(SlideControllerView *)slideController
{
	_authorRootView.userInteractionEnabled = NO;
}
-(void)topViewWillHide:(SlideControllerView *)slideController
{
	_authorRootView.userInteractionEnabled = YES;
}
-(void)onTapAuthorView:(UITapGestureRecognizer*)gesture
{
	AuthorViewController* viewController = [[AuthorViewController alloc] initWithNibName:@"AuthorViewController" withAuthorId:_compositionMiddleEntity.authorRemoteId authorName:_compositionMiddleEntity.authorName];
	[[self navigationController] pushViewController:viewController animated:YES];
	[viewController release];
	
}

-(void)onSegmentControlerStateChanged:(UISegmentedControl*)segmentControl
{
	if(segmentControl.selectedSegmentIndex == 0)
	{
		_subItemsView.hidden = NO;
		_descriptionView.hidden = YES;
	}
	else
	{
		_subItemsView.hidden = YES;
		_descriptionView.hidden = NO;
	}
}

#pragma mark -
-(void)fillInfos
{
	//	[_partsList pushList:_compositionFullyEntity.parts];
	
	_descriptionText.text = _compositionFullyEntity.entityDescription;
	
	
}





#pragma mark -

-(void)dealloc
{
	
	
	[_compositionSlideController release];
	[_titleLabel release];
	[_subtitleLabel release];
	
	[_descriptionView release];
	[_descriptionText release];
	
	[_subItemsView release];
	[_partsList release];
	[_authorRootView release];
	
	[_compositionMiddleEntity release];
	[_compositionFullyEntity release];
	
	
	[super dealloc];
}

@end
