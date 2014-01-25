//
//  ViewController.m
//  ImageBrowser
//
//  Created by yixiaoluo on 14-1-25.
//  Copyright (c) 2014年 yixiaoluo. All rights reserved.
//

#import "ViewController.h"
#import "ImageBrowserViewController.h"

@interface ViewController (){
    
    UIPageViewControllerTransitionStyle         transitionStyle;
    UIPageViewControllerNavigationOrientation   navigationOrientation;

    NSArray                                     *imageURLs;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageURLs = [NSArray arrayWithObjects:@"http://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/300px-PNG_transparency_demonstration_1.png",@"http://static1.wikia.nocookie.net/__cb20120718024114/fantendo/images/6/6e/Small-mario.png",@"http://t0.gstatic.com/images?q=tbn:ANd9GcSgVt3Q2CalXgMqD3LA3yc_acKIJrFWusevJZdyW37BPkpEbGYO",@"http://t1.gstatic.com/images?q=tbn:ANd9GcScdTwEm4Aa6FSyB1oB8pZZ8hLtmvexUVPRMojqykwHx5EOkN4Z",@"http://t2.gstatic.com/images?q=tbn:ANd9GcQSk6K-MiQDEDKOw7HQaN4yARnSphN9PdXJVj_auDbwmWeu6hWh",@"http://t0.gstatic.com/images?q=tbn:ANd9GcRTwybg4xDSkmsTqsQEOAL4CXjrx-sPaA9BOaL579UnYjX6vhMM",@"http://t2.gstatic.com/images?q=tbn:ANd9GcTRMFrtqwKeh1WlIHtsgrt7-7Ulm9q3gYBzgN9hrHzg5_iBIX-6",@"http://t0.gstatic.com/images?q=tbn:ANd9GcQYWt2Q8L2IsU6UsZQ-kN7Vcn6SysYJrTRBcIYxQNiCpbD8TTyo",@"http://t2.gstatic.com/images?q=tbn:ANd9GcSdTg3Hy67TZV97DRDtQt4s9JCpRpiRfm5-IP9-di6DuqD9Qq1b",@"http://static3.wikia.nocookie.net/__cb20111123224557/fantendo/images/5/52/Mushroom2.PNG",@"http://t2.gstatic.com/images?q=tbn:ANd9GcSYhbtjSL7GnioHD5W44RK3cTg7GRPNZAU2w-x8J8TrRAf18zLK",@"http://www.google.com.hk/url?sa=i&rct=j&q=png&source=images&cd=&cad=rja&docid=v0UBCsIk1_iqkM&tbnid=zZx3FSqN5M51yM:&ved=&url=%68%74%74%70%3a%2f%2f%65%6c%62%61%72%62%69%72%72%6f%6a%6f%62%6c%6f%67%75%65%72%6f%2e%77%6f%72%64%70%72%65%73%73%2e%63%6f%6d%2f&ei=lmfjUvasPKe3iQeviYCACw&psig=AFQjCNGBugwD5YxDz8DeH2sz2jfnJyHcfQ&ust=1390721303455285",@"http://static2.wikia.nocookie.net/__cb20090628225130/sonic/images/8/8c/Sonic_115.png",@"http://t3.gstatic.com/images?q=tbn:ANd9GcR2hzBFgmTVtiawzTxCcPG-YXgrV5f4yAiK5JnQYay_rs2Idb3O", nil];
}

- (IBAction)buttonClicked:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    switch (button.tag) {
        case 100:
            transitionStyle = UIPageViewControllerTransitionStylePageCurl;
            break;
        case 101:
            transitionStyle = UIPageViewControllerTransitionStyleScroll;
            break;
        case 102:
            navigationOrientation = UIPageViewControllerNavigationOrientationHorizontal;
            break;
        case 103:
            navigationOrientation = UIPageViewControllerNavigationOrientationVertical;
            break;
 
        default:
            break;
    }
    
    
    ImageBrowserViewController *browser = [[ImageBrowserViewController alloc] initWithTitle:@"Image browser"
                                                                                  imageURLs:imageURLs
                                                                                   fromPage:3];
    browser.transitionStyle = transitionStyle;
    browser.navigationOrientation = navigationOrientation;
    [self presentViewController:browser animated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
