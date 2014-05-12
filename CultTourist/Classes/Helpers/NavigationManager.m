//
//  NavigationManager.m
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "NavigationManager.h"
static NavigationManager* _sharedNavigationManager = nil;
@implementation NavigationManager
+(NavigationManager *)sharedInstance
{
	@synchronized(self)
	{
		if(!_sharedNavigationManager)
		{
			_sharedNavigationManager = [NavigationManager new];
		}
		
		return _sharedNavigationManager;
	}
}


-(UINavigationController*)newsfeedController
{
	if(!_newsFeedController)
	{
		NewsfeedViewController* controller = [[NewsfeedViewController alloc] initWithNibName:@"NewsfeedViewController" bundle:nil];
		_newsFeedController = [[UINavigationController alloc] initWithRootViewController:controller];
		[controller release];
	}
	return _newsFeedController;
}

-(PKRevealController *)revealController
{
	if(!_revealController)
	{
		LeftSideViewController* leftSide = [[LeftSideViewController alloc] initWithNibName:@"LeftSideViewController" bundle:nil];
		UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:leftSide];
		navController.navigationBar.hidden=YES;
		_revealController = [[PKRevealController revealControllerWithFrontViewController:[self newsfeedController] leftViewController:navController] retain];
		[_revealController setMinimumWidth:200 maximumWidth:300 forViewController:navController];
		[navController release];
		[leftSide release];
		
	}
	return _revealController;
}

-(void)showLeftMenu
{
	[_revealController showViewController:_revealController.leftViewController];
}
-(UINavigationController*)getTabForType:(ELeftSideMenuTypes)type
{
	switch (type)
	{
		case ELeftSideMenuTypes_Search:
			return nil;
	case ELeftSideMenuTypes_News:
			return [self newsfeedController];
		case ELeftSideMenuTypes_Favorite:
			return nil;
		case ELeftSideMenuTypes_Bookmarks:
			return nil;
		case ELeftSideMenuTypes_Catalog:
			return nil;
		case ELeftSideMenuTypes_Downloads:
			return nil;
		case ELeftSideMenuTypes_History:
			return nil;
		case ELeftSideMenuTypes_Playlists:
			return nil;
		case ELeftSideMenuTypes_Settings:
			return nil;
		default:
			break;
	}
	return nil;
}
-(void)showTab:(ELeftSideMenuTypes)type navigateToRoot:(BOOL)navigateToRoot
{
	UINavigationController* newControler = [self getTabForType:type];
	if (_revealController.frontViewController!=newControler)
	{
		[_revealController setFrontViewController:newControler];
	}
	else if(navigateToRoot)
	{
		[newControler popToRootViewControllerAnimated:YES];
	}
}

-(void)dealloc
{
	[_revealController release];
	[_newsFeedController release];
	[super dealloc];
}


@end
