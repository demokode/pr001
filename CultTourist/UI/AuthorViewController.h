//
//  AuthorViewController.h
//  CultTourist
//
//  Created by DimasSup on 12.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CustomViewController.h"
#import "AuthorShortEntity.h"
#import "AuthorEntity.h"
#import "SlideControllerView.h"
#import "ActionDownloadFavoriteView.h"
#import "ListControlBase.h"
@interface AuthorViewController : CustomViewController
{
	AuthorShortEntity* _authorShortInfo;
	AuthorEntity* _authorFullInfo;
	
	IBOutlet SlideControllerView* _slideView;
	IBOutlet ActionDownloadFavoriteView* _actionPanel;
	
	IBOutlet UILabel* _authorName;
	IBOutlet UILabel* _dateLabel;
	
	IBOutlet UIView* _descriptionView;
	IBOutlet UITextView* _descriptionText;
	
	IBOutlet UIView* _subItemsView;
	IBOutlet ListControlBase* _partsList;
	
	IBOutlet UISegmentedControl* _segmentControl;

	
	
}
-(IBAction)onSegmentControlerStateChanged:(UISegmentedControl*)segmentControl;

-(id)initWithNibName:(NSString *)nibNameOrNil withAuthorId:(long)authorId authorName:(NSString*)authorName;
-(id)initWithNibName:(NSString *)nibNameOrNil withAuthorShortInfo:(AuthorShortEntity*)authorShortInfo;

@end
