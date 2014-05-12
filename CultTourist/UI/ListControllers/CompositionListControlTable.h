//
//  CompositionListControlTable.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListControlBase.h"

@interface CompositionListControlTable : ListControlBase<UITableViewDelegate,UITableViewDataSource>
{
	UITableView* _tableView;

}
@end
