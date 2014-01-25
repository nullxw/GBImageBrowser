//
//  PPTViewController.h
//  iAP
//
//  Created by yixiaoluo on 14-1-15.
//  Copyright (c) 2014年 gikoo.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullScreenViewController.h"

#define RGBA(r,g,b,a)  [UIColor colorWithRed:r/255 green:g/255. blue:b/255. alpha:a]

@interface ImageBrowserViewController : FullScreenViewController

- (id)initWithTitle:(NSString *)title imageURLs:(NSArray *)array fromPage:(NSInteger)page;

@property (nonatomic) UIPageViewControllerTransitionStyle         transitionStyle;
@property (nonatomic) UIPageViewControllerNavigationOrientation   navigationOrientation;
@property (nonatomic) NSInteger                                   fromPage;

@end
