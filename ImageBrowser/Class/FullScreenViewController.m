//
//  FullScreenViewController.m
//  iAP
//
//  Created by yixiaoluo on 14-1-19.
//  Copyright (c) 2014年 gikoo.cn. All rights reserved.
//

#import "FullScreenViewController.h"

@interface FullScreenViewController ()

@end

@implementation FullScreenViewController

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
	// Do any additional setup after loading the view.
    //creat a navigationbar
    BOOL isIOS7 = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0);
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, isIOS7 ? 0 : 20, 320, isIOS7 ? 64 : 44)];
    navigationBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
    [navigationBar pushNavigationItem:navigationItem animated:YES];
    
    [self.view addSubview:navigationBar];
    
    self.customNavigationBar = navigationBar;
    
    [self setDisplayNavigationBar:NO];
}

- (void)setTitle:(NSString *)title
{
    [self.customNavigationBar.items[0] setTitle:title];
}

- (void)setLeftBarButtonItem:(UIBarButtonItem *)item
{
    [self.customNavigationBar.items[0] setLeftBarButtonItem:item];
}
                                         
- (void)setRightBarButtonItem:(UIBarButtonItem *)item
{
    [self.customNavigationBar.items[0] setRightBarButtonItem:item];
}

- (void)setDisplayNavigationBar:(BOOL)displayNavigationBar
{
    _displayNavigationBar = displayNavigationBar;
    
    self.customNavigationBar.hidden = !_displayNavigationBar;
    
    [[UIApplication sharedApplication] setStatusBarHidden:!_displayNavigationBar];

    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {// iOS 7
        
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view bringSubviewToFront:self.customNavigationBar];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
