//
//  OnePageViewController.h
//  iAP
//
//  Created by yixiaoluo on 14-1-15.
//  Copyright (c) 2014年 gikoo.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildViewController : UIViewController

@property (nonatomic) int  index;

- (instancetype)initWithURL:(NSString *)url touched:(void(^)())touchHandle;


@end
