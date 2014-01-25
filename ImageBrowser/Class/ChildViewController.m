//
//  OnePageViewController.m
//  iAP
//
//  Created by yixiaoluo on 14-1-15.
//  Copyright (c) 2014年 gikoo.cn. All rights reserved.
//

#import "ChildViewController.h"
#import "ZoomImageView.h"
@interface ChildViewController (){
    NSString *imageURL;
    void (^touchHandle)();
}

@end

@implementation ChildViewController

- (instancetype)initWithURL:(NSString *)url touched:(void(^)())aTouch;
{
    self = [super init];
    if (self) {
        // Custom initialization
        imageURL = [url copy];
        touchHandle = [aTouch copy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:imageURL];
    ZoomImageView *scaleImageView = [[ZoomImageView alloc] initWithFrame:self.view.frame
                                                                   image:url
                                                             touchHandle:^(ZoomImageView *view){
                                                                 if (touchHandle) touchHandle();
                                                             }];
    
    scaleImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:scaleImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
