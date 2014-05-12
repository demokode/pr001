//
//  CompositionListControlTable.m
//  CultTourist
//
//  Created by DimasSup on 10.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionListControlTable.h"
#import "CompositionListTableCell.h"
#import "ListItemCompositionContainer.h"
@implementation CompositionListControlTable
@synthesize compositionList = _compositionList;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)initializeView
{
	[super initializeView];
	_tableView = [[UITableView alloc] initWithFrame:self.bounds];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	_tableView.separatorColor = [UIColor colorWithRed:39/255.0 green:145/255.0 blue:205/255.0 alpha:1];
	
	[self addSubview:_tableView];
	UINib* nib = [UINib nibWithNibName:@"CompositionListTableCell" bundle:nil];
	[_tableView registerNib:nib forCellReuseIdentifier:@"composition"];
	_compositionList = [NSMutableArray new];
}
-(void)layoutSubviews
{
	[super layoutSubviews];
	_tableView.frame = self.bounds;
}

-(void)setList:(NSArray *)compositions
{
	[_compositionList release];
	NSMutableArray* temp = [NSMutableArray new];
	for (CompositionMiddleEntity* composition in compositions)
	{
		ListItemCompositionContainer* listItemContainer = [ListItemCompositionContainer new];
		listItemContainer.baseEntity = composition;
		listItemContainer.downloadState = EControlState_On;
		listItemContainer.favoriteState = EControlState_Off;
		[temp addObject:listItemContainer];
		[listItemContainer release];
	}

	_compositionList = temp;
	[_tableView reloadData];
}


#pragma mark - table delgates method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	int count = _compositionList.count;
	return count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 65;
	
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(self.callback && [self.callback respondsToSelector:@selector(onSelectItem:onList:)])
	{
		[self.callback onSelectItem:((ListItemContainerBase*)_compositionList[indexPath.row]).realEntity onList:self];
	}
	   
	   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CompositionListTableCell* cell = [tableView dequeueReusableCellWithIdentifier:@"composition"];
	[cell.slideController forceClose];
	[cell initializeWithItemContainer:[_compositionList objectAtIndex:indexPath.row]];
	return cell;
}

@end
