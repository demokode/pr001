//
//  CompositionShortListControlTable.h
//  CultTourist
//
//  Created by DimasSup on 13.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListControlBase.h"

@interface CompositionShortListControlTable : ListControlBase<UITableViewDelegate,UITableViewDataSource>
{
	UITableView* _tableView;
	
}
@end
