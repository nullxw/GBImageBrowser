//
//  ImageBrowserView.h
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageBrowserView : UIScrollView

//image count per page, 1 is default
@property (nonatomic) NSInteger imageCountPerPage;

//load local image
- (id)initWithFrame:(CGRect)frame imageNames:(NSArray *)names;

//load web image
- (id)initWithFrame:(CGRect)frame imageURLs:(NSArray *)URLs;

@end
