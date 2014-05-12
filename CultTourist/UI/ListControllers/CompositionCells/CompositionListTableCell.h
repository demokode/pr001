//
//  CompositionListTableCell.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableCellBase.h"
#import "ActionDownloadFavoriteView.h"
#import "ListItemCompositionContainer.h"
@interface CompositionListTableCell : ListTableCellBase<ActionDownloadFavoriteDelegate>
{
	IBOutlet ActionDownloadFavoriteView * _actionPanel;
	IBOutlet UIView * _mainView;
	
	IBOutlet UILabel *  _titleLabel;
	IBOutlet UILabel *  _descriptionLabel;
	IBOutlet UIImageView * _iconImage;
	

}
-(ListItemCompositionContainer *)realItemContainer;
@end
