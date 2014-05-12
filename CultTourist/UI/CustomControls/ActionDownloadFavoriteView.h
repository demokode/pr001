//
//  ActionDownloadFavoriteView.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@class ActionDownloadFavoriteView;

/**
 Protocol which declare ActionDwonloadFavoriteView callback
 */
@protocol ActionDownloadFavoriteDelegate <NSObject>
/**
 Called whin download action button clicked
 */
-(BOOL)onDownloadClicked:(ActionDownloadFavoriteView*)view;
/**
 Called when favorite action button clicked
 */
-(BOOL)onFavoriteClicked:(ActionDownloadFavoriteView*)view;

@end

@interface ActionDownloadFavoriteView : UIView
{
	BOOL _isAlreadyInitialize;
	UIButton * _downloadButton;
	UIButton * _favoriteButton;
}
@property(nonatomic,assign)IBOutlet id<ActionDownloadFavoriteDelegate> delegate;

/**
 Get current download button state
 @result EControlState value
 */
@property(nonatomic,readonly)EControlState currentDownloadState;
/**
 Get current favorite button state
 @result EControlState value
 */
@property(nonatomic,readonly)EControlState currentFavoriteState;

/**
 Update download button state
 @see EControlState
 */
-(void)setDownloadState:(EControlState)state;
/**
 Update favorite button state
 @see EControlState
 */
-(void)setFavoriteState:(EControlState)state;



@end
