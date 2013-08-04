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

@interface ImageBrowserView ()

@property (nonatomic, strong) NSArray        *imageNames;

- (void)setupSubViews;

@end

@implementation ImageBrowserView


- (id)initWithFrame:(CGRect)frame imageNames:(NSArray *)names
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.contentSize = CGSizeMake(CGRectGetWidth(frame)*[names count], CGRectGetHeight(frame));
        self.pagingEnabled = YES;
        
        self.imageNames = names;
        
        [names enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL *stop) {
            ZoomImageView *temp= [[ZoomImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
                                                                image:[UIImage imageNamed:name]];
            temp.minScale = .5;
            temp.maxScale = 5.;
            [self addSubview:temp];
        }];
        
        //[self setupSubviews];
    }
    return self;
}

- (void)setupSubViews
{
    
}

@end
