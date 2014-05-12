//
//  AuthorViewController.m
//  CultTourist
//
//  Created by DimasSup on 12.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "AuthorViewController.h"
#import "SkinProvider.h"
#import "ServerApiHelper.h"
@interface AuthorViewController ()

@end

@implementation AuthorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil withAuthorId:(long)authorId authorName:(NSString *)authorName
{
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    if (self)
	{
		_authorShortInfo = [[AuthorShortEntity alloc] initWithRemoteId:authorId name:authorName lastName:nil];
		
    }
    return self;
}
-(id)initWithNibName:(NSString *)nibNameOrNil withAuthorShortInfo:(AuthorShortEntity *)authorShortInfo
{
	self = [super initWithNibName:nibNameOrNil bundle:nil];
	if (self)
	{
		_authorShortInfo = [authorShortInfo retain];
	}
	
	return self;
}




- (void)viewDidLoad
{
	self.barColor = [[SkinProvider sharedSkinProvider] colorForAuthorBar];
	self.titleColor = [UIColor whiteColor];
    [super viewDidLoad];
	[_actionPanel setDownloadState:EControlState_Disable];
	[_actionPanel setFavoriteState:EControlState_Off];
	self.title = NSLocalizedString(@"Автор", @"Автор");
	[[SkinProvider sharedSkinProvider] applyDefaultFontToLabel:_authorName size:18];
	[[SkinProvider sharedSkinProvider] applyDefaultFontToLabel:_dateLabel size:13];
	[[ServerApiHelper sharedServerApiHelper] requestAuthorById:_authorShortInfo.remoteId success:^(AuthorEntity *middleCompositionInfo) {
		_authorFullInfo = [middleCompositionInfo retain];
		[self updateUI];
	} failed:^(NSError *error) {
		
	}];
	
    // Do any additional setup after loading the view from its nib.
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


-(void)updateUI
{
	if(_authorFullInfo)
	{
		_dateLabel.text =[NSString stringWithFormat:@"%@ - %@",_authorFullInfo.birthDate,_authorFullInfo.deathDate];
		_authorName.text = [NSString stringWithFormat:@"%@ %@",_authorFullInfo.name,_authorFullInfo.lastName];
		[_partsList setList:_authorFullInfo.compositionShorts];
	}
}

-(void)dealloc
{
	[_authorShortInfo release];
	[_authorFullInfo release];
	[_authorName release];
	[_dateLabel release];
	[_slideView release];
	[_actionPanel release];
	
	[_descriptionView release];
	[_descriptionText release];
	
	[_subItemsView release];
	[_partsList release];
	
	[_segmentControl release];
	
	[super dealloc];
}


@end
