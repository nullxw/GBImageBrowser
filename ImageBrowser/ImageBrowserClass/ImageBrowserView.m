//
//  ImageBrowserView.m
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import "ImageBrowserView.h"
#import "ZoomContant.h"
#import "ZoomImageView.h"

@implementation ImageBrowserView

- (id)initWithFrame:(CGRect)frame imageNamed:(NSArray *)names
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        frame.origin = CGPointZero;
        
        UIScrollView *scroller  = [[UIScrollView alloc] initWithFrame:frame];
        scroller.contentSize = CGSizeMake(CGRectGetWidth(frame)*[names count], CGRectGetHeight(frame));
        scroller.pagingEnabled = YES;
        
    }
    return self;
}

@end
