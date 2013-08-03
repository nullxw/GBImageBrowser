//
//  IBViewController.m
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import "IBViewController.h"
#import "ZoomImageView.h"

@interface IBViewController ()

@end

@implementation IBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ZoomImageView *test = [[ZoomImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)
                                                           image:[UIImage imageNamed:@"tset"]];
    test.minScale = .5;
    test.maxScale = 5.;
    [self.view addSubview:test];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
