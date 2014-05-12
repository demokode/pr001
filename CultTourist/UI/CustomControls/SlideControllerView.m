//
//  SlideController.m
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "SlideControllerView.h"

@implementation SlideControllerView
@synthesize isAllowActionPanel = _isAllowActionPanel;
@synthesize actionPanelSide;
@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}
-(void)setIsAllowActionPanel:(BOOL)value
{
	if(_isAllowActionPanel!=value)
	{
		_isAllowActionPanel = value;
		if(_isAllowActionPanel)
		{
			[self addGestureRecognizer:_mainPanGesture];
		}
		else
		{
			[self removeGestureRecognizer:_mainPanGesture];
			[self forceClose];
		}
	}
}



- (void)awakeFromNib
{
	if(_isInitialized)
		return;
	_isInitialized = YES;
	_isAllowActionPanel = YES;
	// Initialization code
	_mainTapGesture= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMainViewTap:)];
	
	
	_mainPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onMainViewPanGesture:)];
	_mainPanGesture.delegate = self;
	[self addGestureRecognizer:_mainPanGesture];
	
}


#pragma mark - Gesture and animation logic

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
	if(gestureRecognizer == _mainPanGesture)
	{
		if([_mainPanGesture translationInView:self.rootView].y!=0)
		{
			return NO;
		}
		return [gestureRecognizer locationInView:self.rootView].x>=100;
	}
	return YES;
}

-(void)onMainViewTap:(UITapGestureRecognizer*)tapGesture
{
	if(_isOpen)
	{
		[self hideActionPanel];
		
	}
}
-(void)forceClose
{
	if(_isOpen)
	{
		[UIView setAnimationsEnabled:FALSE];
		[self hideActionPanel];
		[UIView setAnimationsEnabled:YES];
	}
}
-(void)forceOpen
{
	if (!_isOpen)
	{
		[UIView setAnimationsEnabled:FALSE];
		[self showActionPanel];
		[UIView setAnimationsEnabled:YES];
	}
}




-(void)showActionPanel
{
	UIView* mainView = self;
	UIView* actionPanel = [self actionPanel];
	
	if(mainView && actionPanel)
	{
		
		__block CGRect mFrame = mainView.frame;
		
		if (self.delegate && [self.delegate respondsToSelector:@selector(topViewWillOpen:)])
		{
			[self.delegate topViewWillOpen:self];
		}
		
		_isOpen = YES;
		if(self.actionPanelSide == EActionPanelSide_Left)
		{
			mFrame.origin.x = actionPanel.frame.origin.x+actionPanel.frame.size.width;
		}
		else
		{
			mFrame.origin.x = actionPanel.frame.origin.x - mainView.frame.size.width;
		}
		[UIView animateWithDuration:0.3 animations:^{
			mainView.frame = mFrame;
		}];
		[mainView addGestureRecognizer:_mainTapGesture];
	}
	
	
}
-(void)hideActionPanel
{
	UIView* mainView = self;
	if(mainView)
	{
		__block CGRect mFrame = mainView.frame;
		_isOpen = NO;
		if (self.delegate && [self.delegate respondsToSelector:@selector(topViewWillHide:)])
		{
			[self.delegate topViewWillOpen:self];
		}
		
		
		mFrame.origin.x = 0;
		[UIView animateWithDuration:0.3 animations:^{
			mainView.frame = mFrame;
		}];
		[mainView removeGestureRecognizer:_mainTapGesture];
	}
	
	
}

-(void)onMainViewPanGesture:(UIPanGestureRecognizer*)panGesture
{
	
	switch ( panGesture.state) {
		case UIGestureRecognizerStateBegan:
			_lastPoint = [panGesture locationInView:self.rootView];
			break;
		case UIGestureRecognizerStateChanged:
		{
			[self updatePositionForPanGesutre:panGesture];
		}
			break;
		case UIGestureRecognizerStateEnded:
		{
			[self finishPan:panGesture];
		}
			break;
		case UIGestureRecognizerStateCancelled:
		case UIGestureRecognizerStateFailed:
			[self cancelPan:panGesture];
			break;
		default:
			break;
	}
	
	
}

-(void)updatePositionForPanGesutre:(UIPanGestureRecognizer*)panGesture
{
	UIView* mainView = self;
	UIView* actionPanel = [self actionPanel];
	if(mainView && actionPanel)
	{
		
		CGPoint trans = [panGesture locationInView:self.rootView];
		CGRect rect = mainView.frame;
		rect.origin.x+=( trans.x-_lastPoint.x);
		if(self.actionPanelSide == EActionPanelSide_Left)
		{
			rect.origin.x = MIN(MAX(0, rect.origin.x),actionPanel.frame.origin.x+actionPanel.frame.size.width);
		}
		else
		{
			rect.origin.x = MAX(MIN(0,rect.origin.x),actionPanel.frame.origin.x -mainView.frame.size.width);
			
		}
		mainView.frame = rect;
		_lastPoint = trans;
	}
}
-(void)finishPan:(UIPanGestureRecognizer*)panGesture
{
	UIView* mainView = self;
	UIView* actionPanel = [self actionPanel];
	if(!mainView || !actionPanel)
		return;
	BOOL toOpen = NO;
	if(self.actionPanelSide == EActionPanelSide_Left)
	{
		toOpen = mainView.frame.origin.x>actionPanel.frame.origin.x+actionPanel.frame.size.width/2;
		float xV = [panGesture velocityInView:self.rootView].x;
		if(xV>600)
		{
			toOpen = YES;
		}
		else if(xV<-600)
		{
			toOpen = NO;
		}
	}
	else
	{
		toOpen = mainView.frame.origin.x<(actionPanel.frame.origin.x - mainView.frame.size.width)/2;
		float xV = [panGesture velocityInView:self.rootView].x;
		if(xV>600)
		{
			toOpen = NO;
		}
		else if(xV<-600)
		{
			toOpen = YES;
		}
	}
	if (toOpen)
	{
		[self showActionPanel];
	}
	else
	{
		[self hideActionPanel];
	}
}
-(void)cancelPan:(UIPanGestureRecognizer*)panGesture
{
	if(_isOpen)
	{
		[self showActionPanel];
	}
	else
	{
		[self hideActionPanel];
	}
}
#pragma mark -

-(void)dealloc
{
	[_mainTapGesture release];
	[_mainPanGesture release];
	[super dealloc];
}

@end
