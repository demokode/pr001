//
//  NewsfeedViewController.m
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "NewsfeedViewController.h"
#import "ServerApiHelper.h"
#import "CompositionInfoViewController.h"
#import "SkinProvider.h"
#import "BaseEntity.h"
#import "CompositionMiddleEntity.h"
#import "NavigationManager.h"
@interface NewsfeedViewController ()

@end

@implementation NewsfeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
	self.barColor =  [[SkinProvider sharedSkinProvider] colorForTab:ELeftSideMenuTypes_History];
	self.titleColor = [UIColor whiteColor];
    [super viewDidLoad];
	
	
	
	
	self.title = NSLocalizedString(@"Лента", @"Лента");
	[[ServerApiHelper sharedServerApiHelper] requestPopulars:^(NSArray *middleCompositionInfos) {
		[_compositionPopularControl setList:middleCompositionInfos];
	} failed:^(NSError *error) {
		
	}];
    // Do any additional setup after loading the view from its nib.
	
	UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[[SkinProvider sharedSkinProvider] leftMenuIcon] style:UIBarButtonItemStyleBordered target:self action:@selector(onShowMenuClicked:)];
	self.navigationItem.leftBarButtonItem = item;
	[item release];
	
}

-(void)onShowMenuClicked:(id)button
{
	[[NavigationManager sharedInstance] showLeftMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSegmentControlStateChanged:(UISegmentedControl*)sender
{
	switch (sender.selectedSegmentIndex)
	{
		case 0:
			_compositionPopularControl.hidden = NO;
			_compositionNewsControl.hidden = YES;
			_compositionRecomendationControl.hidden = YES;
			if(_compositionPopularControl.compositionList.count==0)
			{
				[[ServerApiHelper sharedServerApiHelper] requestPopulars:^(NSArray *middleCompositionInfos) {
					[_compositionPopularControl setList:middleCompositionInfos];
				} failed:^(NSError *error) {
					
				}];
			}
			
			break;
		case 1:
			_compositionPopularControl.hidden = YES;
			_compositionNewsControl.hidden = NO;
			_compositionRecomendationControl.hidden = YES;
			if(_compositionNewsControl.compositionList.count==0)
			{
				[[ServerApiHelper sharedServerApiHelper] requestPopulars:^(NSArray *middleCompositionInfos) {
					[_compositionNewsControl setList:middleCompositionInfos];
				} failed:^(NSError *error) {
					
				}];
			}
			break;
		case 2:
			_compositionPopularControl.hidden = YES;
			_compositionNewsControl.hidden = YES;
			_compositionRecomendationControl.hidden = NO;
			if(_compositionRecomendationControl.compositionList.count==0)
			{
				[[ServerApiHelper sharedServerApiHelper] requestPopulars:^(NSArray *middleCompositionInfos) {
					[_compositionRecomendationControl setList:middleCompositionInfos];
				} failed:^(NSError *error) {
					
				}];
			}
			break;
		default:
			break;
	}
}

-(void)onSelectItem:(BaseEntity *)selectedEntity onList:(ListControlBase *)listControl
{
	if(selectedEntity && [selectedEntity isKindOfClass:[CompositionMiddleEntity class]])
	{
		CompositionInfoViewController* compositionView  = [[CompositionInfoViewController alloc] initWithNibName:@"CompositionInfoViewController" andCompositionMiddleEntity:(CompositionMiddleEntity*)selectedEntity];
		[self.navigationController pushViewController:compositionView animated:YES];
		[compositionView release];
	}
}
-(void)dealloc
{
	[_segmentControl release];
	[super dealloc];
}
@end
