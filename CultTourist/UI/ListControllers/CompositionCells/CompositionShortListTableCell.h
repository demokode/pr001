//
//  CompositionShortListTableCell.h
//  CultTourist
//
//  Created by DimasSup on 13.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableCellBase.h"
#import "ActionDownloadFavoriteView.h"
#import "CompositionShortContainer.h"

	
@interface CompositionShortListTableCell : ListTableCellBase
{
	
	IBOutlet ActionDownloadFavoriteView * _actionPanel;

	
	IBOutlet UILabel *  _titleLabel;
}
-(CompositionShortContainer *)realItemContainer;
@end
