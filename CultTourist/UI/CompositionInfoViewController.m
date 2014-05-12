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
	self.barColor =  [[SkinProvider sharedSkinProvider] colorForTab:ELeftSideMenuTypes_None];
	self.titleColor = [[SkinProvider sharedSkinProvider] colorForTab:ELeftSideMenuTypes_History];
	
    [super viewDidLoad];
	
	if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
	{
        // Load resources for iOS 6.1 or earlier
    }
	else
	{
        // Load resources for iOS 7 or later
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
		self.navigationController.navigationBar.alpha = 1;
    }
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
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
}
-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	//	UINavigationItem* item =  self.navigationController.navigationBar.backItem;
	
	
}
#pragma mark -

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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
	
	
	[_compositionSlideController release];
	[_titleLabel release];
	[_subtitleLabel release];
	
	[_descriptionView release];
	[_descriptionText release];
	
	[_subItemsView release];
	[_partsList release];
	
	
	[_compositionMiddleEntity release];
	[_compositionFullyEntity release];
	[super dealloc];
}

@end
