//
//  ScaleImageView.m
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import "ZoomImageView.h"
#import "UIImageView+AFNetworking.h"

@interface ZoomImageView ()

@property (nonatomic, strong) UIImageView *scaleImageView;
@property (nonatomic, copy)   void(^touchedHandle)(ZoomImageView *);
@end

@implementation ZoomImageView

- (id)initWithFrame:(CGRect)frame
              image:(NSURL *)image
        touchHandle:(void(^)(ZoomImageView *))touched
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.touchedHandle = touched;
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectChangeOrigin(frame, 0, 0)];
        scrollView.delegate = self;
        scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        scrollView.backgroundColor = [UIColor blackColor];
        scrollView.minimumZoomScale = 1;
        scrollView.maximumZoomScale = 3;
        [self addSubview:scrollView];
        
        self.scaleImageView = [[UIImageView alloc] initWithFrame:CGRectChangeOrigin(frame, 0, 0)];
        self.scaleImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.scaleImageView.userInteractionEnabled = YES;
        self.scaleImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.scaleImageView setImageWithURL:image
                            placeholderImage:[UIImage imageNamed:@"default_question_pic.png"]];
        [scrollView addSubview:self.scaleImageView];
        
        [self centerScrollViewContents:scrollView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [scrollView addGestureRecognizer:tap];
    }
    return self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.scaleImageView;
}

- (void)centerScrollViewContents:(UIScrollView *)scrollView
{
    CGSize boundsSize = scrollView.bounds.size;
    CGRect contentsFrame = self.scaleImageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.scaleImageView.frame = contentsFrame;
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollViewContents:scrollView];
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    self.scaleImageView.superview.backgroundColor = [UIColor clearColor];
    self.touchedHandle(self);
}

- (void)dealloc
{
    NSLog(@"release 11");
}
@end
