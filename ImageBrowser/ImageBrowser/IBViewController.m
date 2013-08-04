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
//    NSString *url1 = @"http://pic002.cnblogs.com/images/2010/142469/2010113022482135.png";
//    NSString *url2 = @"http://ww1.sinaimg.cn/large/65cc0af7gw1e2uxd1gmhwj.jpg";
//    ImageBrowserView *browser = [[ImageBrowserView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),  CGRectGetHeight(self.view.frame))
//                                                             imageURLs:[NSArray arrayWithObjects:url1,url2,url1,url2,nil]];
//
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
