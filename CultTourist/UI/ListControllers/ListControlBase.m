//
//  CompositionListControl.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "ListControlBase.h"

@implementation ListControlBase
@synthesize callback;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
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
	
}


-(void)pushList:(NSArray *)entities
{
	
}
-(void)clearList
{
	
}
-(void)setList:(NSArray *)entities
{
	
}
@end
