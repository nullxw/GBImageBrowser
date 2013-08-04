//
//  ImageBrowserView.m
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import "ImageBrowserView.h"
#import "ZoomImageView.h"

#define TAGBASE 100

@interface ImageBrowserView ()

@property (nonatomic, strong) NSArray        *imageNames;

@end

@implementation ImageBrowserView


- (id)initWithFrame:(CGRect)frame imageNames:(NSArray *)names
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.contentSize = CGSizeMake(CGRectGetWidth(frame)*[names count], CGRectGetHeight(frame));
        self.pagingEnabled = YES;
        
        _imageNames = names;
        _imageCountPerPage = 1;
        
        [names enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL *stop) {
            ZoomImageView *temp= [[ZoomImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame)*idx, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
                                                                image:[UIImage imageNamed:name]];
            temp.minScale = .5;
            temp.maxScale = 5.;
            temp.tag = TAGBASE + idx;
            [self addSubview:temp];
        }];
    }
    return self;
}

- (void)setImageCountPerPage:(NSInteger)imageCountPerPage
{
    if (_imageCountPerPage == imageCountPerPage) return;
    
    _imageCountPerPage = imageCountPerPage;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    int add = [_imageNames count]%_imageCountPerPage > 0 ? 1 : 0;
    self.contentSize = CGSizeMake(([_imageNames count]/_imageCountPerPage + add) * CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    
    [_imageNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL *stop) {
        UIView *view = [self viewWithTag:TAGBASE + idx];
        [view setFrame:CGRectMake(CGRectGetWidth(self.frame)/_imageCountPerPage*idx, 0, CGRectGetWidth(self.frame)/_imageCountPerPage, CGRectGetHeight(self.frame))];
        NSLog(@"view %@",view);
    }];
}

@end
