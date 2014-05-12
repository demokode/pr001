//
//  ActionDownloadFavoriteView.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ActionDownloadFavoriteView.h"
#import "SkinProvider.h"
@implementation ActionDownloadFavoriteView
@synthesize delegate;
@synthesize currentDownloadState = _currentDownloadState;
@synthesize currentFavoriteState = _currentFavoriteState;
#pragma mark -
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		if(!_isAlreadyInitialize)
		{
			_isAlreadyInitialize = YES;
			[self initializeView];
		}
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
	self= [super initWithCoder:aDecoder];
	if(self)
	{
		if(!_isAlreadyInitialize)
		{
			_isAlreadyInitialize = YES;
			[self initializeView];
		}
	}
	return self;
}
- (id)init
{
    self = [super init];
    if (self)
	{
		if(!_isAlreadyInitialize)
		{
			_isAlreadyInitialize = YES;
			[self initializeView];
		}
    }
    return self;
}
-(void)initializeView
{
	_favoriteButton = [UIButton new];
	[_favoriteButton addTarget:self action:@selector(onFavoriteClicked:) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:_favoriteButton];
	_downloadButton = [UIButton new];
	[_downloadButton addTarget:self action:@selector(onDownloadClicked:) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:_downloadButton];
	[self setDownloadState:EControlState_Off];
	[self setFavoriteState:EControlState_Off];
}
#pragma mark -

-(void)onDownloadClicked:(UIButton*)button
{
	if(_currentDownloadState==EControlState_Off)
	{
		if (delegate && [delegate respondsToSelector:@selector(onDownloadClicked:)])
		{
			if( [self.delegate onDownloadClicked:self])
			{
				[self setDownloadState:EControlState_On];
			}
		}
	}
}
-(void)onFavoriteClicked:(UIButton*)button
{
	if(_currentFavoriteState==EControlState_Off)
	{
		if (delegate && [delegate respondsToSelector:@selector(onFavoriteClicked:)])
		{
			if( [self.delegate onFavoriteClicked:self])
			{
				[self setFavoriteState:EControlState_On];
			}
		}
	}
}

#pragma mark -
-(void)setDownloadState:(EControlState)state
{
	_currentDownloadState = state;
	if (state)
	{
		
		_downloadButton.hidden= NO;
		[_downloadButton setImage:state==EControlState_On?[[SkinProvider sharedSkinProvider] downloadActionActiveIcon]:[[SkinProvider sharedSkinProvider] downloadActionNormalIcon] forState:UIControlStateNormal];
	}
	else
	{
		_downloadButton.hidden= YES;
	}
}
-(void)setFavoriteState:(EControlState)state
{
	_currentFavoriteState = state;
	if (state)
	{
		_favoriteButton.hidden= NO;
		[_favoriteButton setImage:state==EControlState_On?[[SkinProvider sharedSkinProvider] favoriteActionActiveIcon]:[[SkinProvider sharedSkinProvider] favoriteActionNormalIcon] forState:UIControlStateNormal];
	}
	else
	{
		_favoriteButton.hidden= YES;
	}
}





#pragma mark -

-(void)layoutSubviews
{
	[super layoutSubviews];
	CGRect downloadRect = CGRectZero;
	CGRect favoriteRect = CGRectZero;
	if(_currentDownloadState == EControlState_Disable )
	{
		favoriteRect = self.bounds;
	}
	else if(_currentFavoriteState == EControlState_Disable)
	{
		downloadRect = self.bounds;
	}
	else
	{
		if(self.bounds.size.width>=self.bounds.size.height)
		{
			downloadRect = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height);
			favoriteRect = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height);
		}
		else
		{
			downloadRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/2);
			favoriteRect = CGRectMake(0, self.bounds.size.height/2, self.bounds.size.width, self.bounds.size.height/2);
		}
	}
	_downloadButton.frame = downloadRect;
	_favoriteButton.frame = favoriteRect;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
