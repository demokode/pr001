//
//  ListTableCellBase.h
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ListItemContainerBase.h"
#import "SlideControllerView.h"
@interface ListTableCellBase : UITableViewCell<SlideControllerDelegate>
{
@protected
	ListItemContainerBase* _container;
}
@property(nonatomic,retain)IBOutlet SlideControllerView* slideController;
@property(nonatomic,readonly)ListItemContainerBase* container;
-(void)initializeWithItemContainer:(ListItemContainerBase*)container;
-(ListItemContainerBase*)realItemContainer;
#pragma mark -


@end
