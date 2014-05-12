//
//  CompositionShortListControlTable.m
//  CultTourist
//
//  Created by DimasSup on 13.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CompositionShortListControlTable.h"
#import "CompositionShortEntity.h"
#import "CompositionShortContainer.h"
#import "CompositionShortListTableCell.h"
@implementation CompositionShortListControlTable
@synthesize itemsList = _itemsList;
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
	UINib* nib = [UINib nibWithNibName:@"CompositionShortListTableCell" bundle:nil];
	[_tableView registerNib:nib forCellReuseIdentifier:@"scomp"];
	_itemsList = [NSMutableArray new];
}
-(void)layoutSubviews
{
	[super layoutSubviews];
	_tableView.frame = self.bounds;
}

-(void)setList:(NSArray *)compositions
{
	[_itemsList release];
	NSMutableArray* temp = [NSMutableArray new];
	for (CompositionShortEntity* composition in compositions)
	{
		CompositionShortContainer* listItemContainer = [CompositionShortContainer new];
		listItemContainer.baseEntity = composition;
		listItemContainer.downloadState = EControlState_On;
		listItemContainer.favoriteState = EControlState_Off;
		[temp addObject:listItemContainer];
		[listItemContainer release];
	}
	
	_itemsList = temp;
	[_tableView reloadData];
}


#pragma mark - table delgates method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	int count = _itemsList.count;
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
		[self.callback onSelectItem:((CompositionShortContainer*)_itemsList[indexPath.row]).realEntity onList:self];
	}
	
	
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ListItemContainerBase* container = [_itemsList objectAtIndex:indexPath.row];
	CompositionShortListTableCell* cell = [tableView dequeueReusableCellWithIdentifier:container.identifier];
	[cell.slideController forceClose];
	[cell initializeWithItemContainer:container];
	return cell;
}
@end
