//
//  FullScreenViewController.h
//  iAP
//
//  Created by yixiaoluo on 14-1-19.
//  Copyright (c) 2014年 gikoo.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullScreenViewController : UIViewController

@property (strong, nonatomic) UINavigationBar *customNavigationBar;
@property (nonatomic)         BOOL            displayNavigationBar;

- (void)setLeftBarButtonItem:(UIBarButtonItem *)item;
- (void)setRightBarButtonItem:(UIBarButtonItem *)item;

@end
