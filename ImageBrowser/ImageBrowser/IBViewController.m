//
//  IBViewController.m
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import "IBViewController.h"
#import "ImageBrowserView.h"

@interface IBViewController ()

@end

@implementation IBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    ImageBrowserView *browser = [[ImageBrowserView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),  CGRectGetHeight(self.view.frame))
                                                             imageNames:[NSArray arrayWithObjects:@"tset",@"tset",@"tset",@"tset",nil]];
    browser.imageCountPerPage = 3;
    browser.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:browser];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
