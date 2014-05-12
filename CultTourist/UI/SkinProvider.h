//
//  SkinProvider.h
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
@interface SkinProvider : NSObject
{
	UIImage* _downloadActionNormalIcon;
	UIImage* _downloadActionActiveIcon;
	UIImage* _favoriteActionActiveIcon;
	UIImage* _favoriteActionNormalIcon;
	
	UIImage* _leftMenuIcon;
	
	
}
+(SkinProvider *) sharedSkinProvider;
-(void)clearImages;

-(UIImage*)downloadActionNormalIcon;
-(UIImage*)downloadActionActiveIcon;
-(UIImage*)favoriteActionNormalIcon;
-(UIImage*)favoriteActionActiveIcon;

-(UIImage*)leftMenuIcon;

-(void)applyDefaultFontToLabel:(UILabel*)label size:(float)size;
-(void)applyDefaultFontToButton:(UIButton*)button size:(float)size;
-(UIFont*)fontWithSize:(float)size;

-(UIColor*)colorForTab:(ELeftSideMenuTypes)tab;
-(UIColor*)colorForAuthorBar;
-(UIColor*)colorForCompositionBar;
@end
