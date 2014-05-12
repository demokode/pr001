//
//  NewsfeedViewController.h
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomViewController.h"
#import "ListControlBase.h"
@interface NewsfeedViewController : CustomViewController<ListControlDelegate>
{
	IBOutlet UISegmentedControl* _segmentControl;
	IBOutlet ListControlBase* _compositionPopularControl;
	IBOutlet ListControlBase* _compositionNewsControl;
	IBOutlet ListControlBase* _compositionRecomendationControl;
	
	
}
-(IBAction)onSegmentControlStateChanged:(id)sender;
@end
