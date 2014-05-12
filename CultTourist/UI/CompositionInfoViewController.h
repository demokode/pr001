//
//  CompositionInfoViewController.h
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomViewController.h"
#import "ActionDownloadFavoriteView.h"
#import "SlideControllerView.h"
#import "CompositionMiddleEntity.h"
#import "CompositionEntity.h"
#import "ListControlBase.h"
@interface CompositionInfoViewController : CustomViewController<SlideControllerDelegate,ActionDownloadFavoriteDelegate>
{
	IBOutlet SlideControllerView* _compositionSlideController;
	
	IBOutlet UILabel* _titleLabel;
	IBOutlet UILabel* _subtitleLabel;
	
	IBOutlet UIView* _descriptionView;
	IBOutlet UITextView* _descriptionText;

	IBOutlet UIView* _subItemsView;
	IBOutlet ListControlBase* _partsList;

	IBOutlet UIView* _authorRootView;
	
	CompositionMiddleEntity* _compositionMiddleEntity;
	CompositionEntity* _compositionFullyEntity;
	

}
-(id)initWithNibName:(NSString *)nibNameOrNil andCompositionMiddleEntity:(CompositionMiddleEntity*)entity;


-(IBAction)onSegmentControlerStateChanged:(UISegmentedControl*)segmentControl;
@end
