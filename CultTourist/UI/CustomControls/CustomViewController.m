//
//  CustomViewController.m
//  CultTourist
//
//  Created by DimasSup on 11.05.14.
//  Copyright (c) 2014 DimasSup. All rights reserved.
//

#import "CustomViewController.h"
#import "SkinProvider.h"
@interface CustomViewController ()

@end

@implementation CustomViewController
@synthesize barColor;
@synthesize titleColor;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
	{
        // Load resources for iOS 6.1 or earlier
    }
	else
	{
        // Load resources for iOS 7 or later
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = YES;
		self.navigationController.navigationBar.alpha = 1;
		
    }

	
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBar.barTintColor = self.barColor?self.barColor:[UIColor whiteColor];
	
	self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [[SkinProvider sharedSkinProvider] fontWithSize:24],
																	NSForegroundColorAttributeName:self.titleColor?self.titleColor:[UIColor whiteColor]
																	};
	
	UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.navigationItem.backBarButtonItem =item;
	[item release];
	
	self.navigationController.navigationBar.tintColor = self.titleColor?self.titleColor:[UIColor whiteColor];
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
	[titleColor release];
	[barColor release];
	[super dealloc];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
