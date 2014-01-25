//
//  PPTViewController.m
//  iAP
//
//  Created by yixiaoluo on 14-1-15.
//  Copyright (c) 2014年 gikoo.cn. All rights reserved.
//

#import "ImageBrowserViewController.h"
#import "ChildViewController.h"

@interface ImageBrowserViewController ()<
UIPageViewControllerDataSource,
UIPageViewControllerDelegate
>{
    NSString             *pptTitle;
    NSArray              *pptURLs;
}


@property (strong, nonatomic)      UIPageViewController *pageViewController;
@property (strong, nonatomic)      NSMutableArray       *viewControllers;
@property (strong, nonatomic)      UILabel              *pageIndicator;

@end

@implementation ImageBrowserViewController

- (id)initWithTitle:(NSString *)title imageURLs:(NSArray *)array fromPage:(NSInteger)page;
{
    self = [super init];
    if (self) {
        // Custom initialization
        pptTitle = title;
        pptURLs =  array;
        self.fromPage = page;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = pptTitle;
    [self setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClicked:)] ];
    
    //show page indicator
    UILabel *pageIndicator = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, 126, 30)];
    pageIndicator.textColor = [UIColor whiteColor];
    
    pageIndicator.backgroundColor = RGBA(0, 0, 0, .5);
    pageIndicator.textColor = RGBA(3, 163, 255,1);
    pageIndicator.textAlignment = UITextAlignmentCenter;
    pageIndicator.layer.cornerRadius = 15;
    self.pageIndicator = pageIndicator;
    
    //content
    self.pageViewController = [[UIPageViewController alloc]
                               initWithTransitionStyle:self.transitionStyle
                               navigationOrientation:self.navigationOrientation
                               options:nil];
    
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;

    self.viewControllers = [NSMutableArray array];
    [pptURLs enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        [self.viewControllers addObject:[self viewControllerAtIndex:idx]];
    }];
    
    [self.pageViewController setViewControllers:[NSArray arrayWithObject:self.viewControllers[self.fromPage]]
                                      direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
    self.pageViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
    [self addChildViewController:self.pageViewController];
    
    [self.view addSubview:self.pageViewController.view];
    [self.view addSubview:pageIndicator];
    
    [self showPageIndicator];
}

- (void)doneButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)setPageIndicatorHidden
{
    [UIView animateWithDuration:.1 animations:^{
        self.pageIndicator.alpha = 0;
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {//for ios7
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    [self showPageIndicator];
}

- (void)showPageIndicator
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    int currentIndex = [self.viewControllers indexOfObject:self.pageViewController.viewControllers.lastObject];
    
    self.pageIndicator.alpha = 1;
    self.pageIndicator.text = [NSString stringWithFormat:@"第%d页/共%d页", currentIndex + 1, self.viewControllers.count];
    
    [self performSelector:@selector(setPageIndicatorHidden) withObject:nil afterDelay:2.0];
}

//MARK: UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    [self showPageIndicator];
}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return UIPageViewControllerSpineLocationMin;
}

//MARK: UIPageViewControllerDataSource
- (ChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    __weak typeof(self) wself = self;
    ChildViewController* childViewController = [[ChildViewController alloc] initWithURL:pptURLs[index]
                                                                             touched:^{
                                                                                 wself.displayNavigationBar = !wself.displayNavigationBar;
                                                                                 [wself showPageIndicator];
                                                                             }];
    childViewController.index = index;
    
    return childViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ChildViewController *)viewController index];
    
    if (index == 0)  return nil;
    
    // Decrease the index by 1 to return
    index--;
    
    return self.viewControllers[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ChildViewController *)viewController index];
    
    if (index == self.viewControllers.count - 1)  return nil;
    
    index++;

    return self.viewControllers[index];
}
@end
