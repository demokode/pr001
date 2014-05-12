//
//  LeftSideViewController.m
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "LeftSideViewController.h"
#import "LeftMenuItemCell.h"
#import "Constants.h"
#import "NavigationManager.h"
@interface LeftSideViewController ()

@end

@implementation LeftSideViewController
-(void)dealloc
{
	[_tableView release];
	[_menuItems release];
	[super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		_menuItems = [[NSArray alloc ] initWithObjects:
					  @{@"name":NSLocalizedString(@"Поиск", @"Поиск"),@"icon":[UIImage imageNamed:@"leftmenu_icon_search" ],@"type":@(ELeftSideMenuTypes_Search)},
					  @{@"name":NSLocalizedString(@"Лента", @"Лента"),@"icon":[UIImage imageNamed:@"leftmenu_icon_news" ],@"type":@(ELeftSideMenuTypes_News)},
					  @{@"name":NSLocalizedString(@"Избранное", @"Избранное"),@"icon":[UIImage imageNamed:@"leftmenu_icon_favorites" ],@"type":@(ELeftSideMenuTypes_Favorite)},
					  @{@"name":NSLocalizedString(@"Каталог", @"Каталог"),@"icon":[UIImage imageNamed:@"leftmenu_icon_catalog" ],@"type":@(ELeftSideMenuTypes_Catalog)},
					  @{@"name":NSLocalizedString(@"Закладки", @"Закладки"),@"icon":[UIImage imageNamed:@"leftmenu_icon_bookmark" ],@"type":@(ELeftSideMenuTypes_Bookmarks)},
					  @{@"name":NSLocalizedString(@"История", @"История"),@"icon":[UIImage imageNamed:@"leftmenu_icon_history" ],@"type":@(ELeftSideMenuTypes_History)},
					  @{@"name":NSLocalizedString(@"Плейлисты", @"Плейлисты"),@"icon":[UIImage imageNamed:@"leftmenu_icon_playlist" ],@"type":@(ELeftSideMenuTypes_Playlists)},
					  @{@"name":NSLocalizedString(@"Загрузки", @"Загрузки"),@"icon":[UIImage imageNamed:@"leftmenu_icon_download" ],@"type":@(ELeftSideMenuTypes_Downloads)},
					  @{@"name":NSLocalizedString(@"Настройки", @"Настройки"),@"icon":[UIImage imageNamed:@"leftmenu_icon_settings" ],@"type":@(ELeftSideMenuTypes_Settings)},
					  
					   nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UINib* nib = [UINib nibWithNibName:@"LeftMenuItemCell" bundle:nil];
	[_tableView registerNib:nib forCellReuseIdentifier:@"menuitem"];
	
	if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
	{
        // Load resources for iOS 6.1 or earlier
    }
	else
	{
        // Load resources for iOS 7 or later
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.navigationController.navigationBarHidden = YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegates

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary* selected = _menuItems[indexPath.row];
	[[NavigationManager sharedInstance] showTab:[selected[@"type"] intValue] navigateToRoot:YES];
	[[[NavigationManager sharedInstance] revealController] showViewController:[[NavigationManager sharedInstance] revealController].frontViewController];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _menuItems.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	LeftMenuItemCell* cell = [tableView dequeueReusableCellWithIdentifier:@"menuitem"];
	cell.name.text = [[_menuItems objectAtIndex:indexPath.row] valueForKey:@"name"];
	cell.icon.image = [[_menuItems objectAtIndex:indexPath.row] valueForKey:@"icon"];
	return cell;
}
@end
