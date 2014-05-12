//
//  SkinProvider.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "SkinProvider.h"
static SkinProvider *sharedSkinProviderInstance = nil;

@implementation SkinProvider

+(SkinProvider *) sharedSkinProvider
{
    @synchronized(self) {
        if (sharedSkinProviderInstance == nil) {
            sharedSkinProviderInstance = [[self alloc] init];
        }
        return sharedSkinProviderInstance;
    }
}

-(UIColor *)colorForTab:(ELeftSideMenuTypes)tab
{
	switch (tab) {
		case ELeftSideMenuTypes_News:
			return [UIColor colorWithRed:0.604 green:0.82 blue:0.949 alpha:1.0];
			break;
		case ELeftSideMenuTypes_Search:
			return [UIColor colorWithRed:0.776 green:0.894 blue:0.976 alpha:1.0];
		case ELeftSideMenuTypes_Favorite:
			return [UIColor colorWithRed:0.949 green:0.808 blue:0.561 alpha:1.0];
		case ELeftSideMenuTypes_Bookmarks:
			return [UIColor colorWithRed:0.941 green:0.522 blue:0.584 alpha:1.0];
		case ELeftSideMenuTypes_Catalog:
			return [UIColor colorWithRed:0.294 green:0.569 blue:0.804 alpha:1.0];
		case ELeftSideMenuTypes_History:
			return [UIColor colorWithRed:0.094 green:0.396 blue:0.616 alpha:1.0];
		case ELeftSideMenuTypes_Playlists:
			return [UIColor colorWithRed:0.439 green:0.463 blue:0.714 alpha:1.0];
		case ELeftSideMenuTypes_Downloads:
			return [UIColor colorWithRed:0.122 green:0.69 blue:0.635 alpha:1.0];
		case ELeftSideMenuTypes_Settings:
			return [UIColor colorWithRed:0.039 green:0.255 blue:0.396 alpha:1.0];
		default:
			return [UIColor colorWithRed:0.545 green:0.722 blue:0.894 alpha:1.0];
			break;
	}
}


-(UIImage *)downloadActionActiveIcon
{
	if(!_downloadActionActiveIcon)
	{
		NSAutoreleasePool* pool = [NSAutoreleasePool new];
		_downloadActionActiveIcon = [UIImage imageNamed:@"icon_download_activ"];
		[pool release];
	}
	return _downloadActionActiveIcon;
}
-(UIImage *)downloadActionNormalIcon
{
	if(!_downloadActionNormalIcon)
	{
		NSAutoreleasePool* pool = [NSAutoreleasePool new];
		_downloadActionNormalIcon = [UIImage imageNamed:@"icon_download_normal"];
		[pool release];
	}
	return _downloadActionNormalIcon;
}
-(UIImage *)favoriteActionActiveIcon
{
	if(!_favoriteActionActiveIcon)
	{
		NSAutoreleasePool* pool = [NSAutoreleasePool new];
		_favoriteActionActiveIcon = [UIImage imageNamed:@"icon_favorites_activ"];
		[pool release];
	}
	return _favoriteActionActiveIcon;
}
-(UIImage *)favoriteActionNormalIcon
{
	if(!_favoriteActionNormalIcon)
	{
		NSAutoreleasePool* pool = [NSAutoreleasePool new];
		_favoriteActionNormalIcon = [UIImage imageNamed:@"icon_favorites_normal"];
		[pool release];
	}
	return _favoriteActionNormalIcon;
}

-(UIImage *)leftMenuIcon
{
	if(!_leftMenuIcon)
	{
		NSAutoreleasePool* pool = [NSAutoreleasePool new];
		_leftMenuIcon = [UIImage imageNamed:@"icon_menu"];
		[pool release];
	}
	return _leftMenuIcon;
}


-(UIColor *)colorForAuthorBar
{
	return [UIColor colorWithRed:0.424 green:0.659 blue:0.851 alpha:1]; /*#6ca8d9*/
}
-(UIColor *)colorForCompositionBar
{
	return [UIColor colorWithRed:0.545 green:0.722 blue:0.894 alpha:1]; /*#8bb8e4*/
}

-(void)applyDefaultFontToLabel:(UILabel*)label size:(float)size
{
	label.font = [UIFont fontWithName:@"PT Sans" size:size];
}
-(void)applyDefaultFontToButton:(UIButton*)button size:(float)size
{
	[[button titleLabel] setFont:[UIFont fontWithName:@"PT Sans" size:size]];
}
-(UIFont *)fontWithSize:(float)size
{
	return [UIFont fontWithName:@"PT Sans" size:size];
}
-(void)dealloc
{
	[self clearImages];
	[super dealloc];
}
-(void)clearImages
{
	[_downloadActionActiveIcon release],_downloadActionActiveIcon = nil;
	[_downloadActionNormalIcon release],_downloadActionNormalIcon = nil;
	[_favoriteActionActiveIcon release],_favoriteActionActiveIcon = nil;
	[_favoriteActionNormalIcon release],_favoriteActionNormalIcon = nil;
	[_leftMenuIcon release],_leftMenuIcon = nil;
}


@end
