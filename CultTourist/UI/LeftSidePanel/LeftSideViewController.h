//
//  LeftSideViewController.h
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftSideViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	IBOutlet UITableView* _tableView;
	NSArray* _menuItems;
}
@end
