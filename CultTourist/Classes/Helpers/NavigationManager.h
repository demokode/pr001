//
//  NavigationManager.h
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKRevealController.h"
#import "LeftSideViewController.h"
#import "NewsfeedViewController.h"
#import "Constants.h"
/**
Singletone class which contain views instances;
 */
@interface NavigationManager : NSObject
{
	PKRevealController* _revealController;
	UINavigationController* _newsFeedController;
}
+(NavigationManager*)sharedInstance;

/**
 Set current right side controller or navigate to root if it is active now;
 */
-(void)showTab:(ELeftSideMenuTypes)type navigateToRoot:(BOOL)navigateToRoot;
-(void)showLeftMenu;

-(PKRevealController*)revealController;

@end
