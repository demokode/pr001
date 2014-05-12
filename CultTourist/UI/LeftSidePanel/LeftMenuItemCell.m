//
//  LeftMenuItemCell.m
//  CultTourist
//
//  Created by DimasSup on 09.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "LeftMenuItemCell.h"

@implementation LeftMenuItemCell
@synthesize icon;
@synthesize name;
- (void)awakeFromNib
{
    // Initialization code
	self.backgroundColor = self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	self.contentView.backgroundColor = selected?[UIColor colorWithRed:0 green:0 blue:0.8 alpha:0.3]:[UIColor clearColor];
    // Configure the view for the selected state
}

-(void)dealloc
{
	[name release];
	[icon release];
	[super dealloc];
	
}

@end
