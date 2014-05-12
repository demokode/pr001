//
//  SlideController.h
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
@class SlideControllerView;
@protocol SlideControllerDelegate <NSObject>


@optional
-(void)topViewWillOpen:(SlideControllerView*)slideController;
-(void)topViewWillHide:(SlideControllerView*)slideController;

@end
@interface SlideControllerView : UIView<UIGestureRecognizerDelegate>
{
	BOOL _isInitialized;
	
	UITapGestureRecognizer * _mainTapGesture;
	UIPanGestureRecognizer * _mainPanGesture;
	CGPoint _lastPoint;
	BOOL _isOpen;
}
@property(nonatomic,readonly)BOOL isOpened;
@property(nonatomic)BOOL isAllowActionPanel;
@property(nonatomic)EActionPanelSide actionPanelSide;
@property(nonatomic,assign)IBOutlet id<SlideControllerDelegate> delegate;
@property(nonatomic,assign)IBOutlet UIView* actionPanel;
@property(nonatomic,assign)IBOutlet UIView* rootView;
#pragma mark -

/**
 Hide action panel
 */
-(void)forceClose;

/**
 Show action panel;
 */
-(void)forceOpen;


-(void)showActionPanel;
-(void)hideActionPanel;
@end
