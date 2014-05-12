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
@protocol ActionDownloadFavoriteDelegate <NSObject>

-(BOOL)onDownloadClicked:(ActionDownloadFavoriteView*)view;
-(BOOL)onFavoriteClicked:(ActionDownloadFavoriteView*)view;

@end

@interface ActionDownloadFavoriteView : UIView
{
	BOOL _isAlreadyInitialize;
	UIButton * _downloadButton;
	UIButton * _favoriteButton;
}
@property(nonatomic,assign)IBOutlet id<ActionDownloadFavoriteDelegate> delegate;
@property(nonatomic,readonly)EControlState currentDownloadState;
@property(nonatomic,readonly)EControlState currentFavoriteState;
-(void)setDownloadState:(EControlState)state;
-(void)setFavoriteState:(EControlState)state;



@end
