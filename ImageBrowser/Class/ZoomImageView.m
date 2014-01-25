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
              image:(NSURL *)imageURL
        touchHandle:(void(^)(ZoomImageView *))touched
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.touchedHandle = touched;
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
        scrollView.delegate = self;
        scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        scrollView.backgroundColor = [UIColor blackColor];
        scrollView.minimumZoomScale = 1;
        scrollView.maximumZoomScale = 8;
        [self addSubview:scrollView];
        
        self.scaleImageView = [[UIImageView alloc] initWithFrame:frame];
        self.scaleImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.scaleImageView.userInteractionEnabled = YES;
        self.scaleImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        //image cahche path
        NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:imageURL.absoluteString.lastPathComponent];
        
        UIImage *img = nil;
        if ([imageURL.absoluteString hasPrefix:(@"file:")]) {
            img = [[UIImage alloc] initWithContentsOfFile:imageURL.absoluteString];
        }else{
            img = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
        }
        
        if (img)  self.scaleImageView.image = img;
        else{
            UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            indicator.bounds = CGRectMake(0, 0, 30, 30);
            indicator.center = self.scaleImageView.center;
            indicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
            [self.scaleImageView addSubview:indicator];
            
            [indicator startAnimating];
            __weak typeof(self) wself = self;
            [self.scaleImageView setImageWithURLRequest:[NSURLRequest requestWithURL:imageURL]
                                       placeholderImage:nil
                                                success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                                    wself.scaleImageView.contentMode = UIViewContentModeScaleAspectFit;
                                                    wself.scaleImageView.image = image;
                                                    
                                                    [indicator stopAnimating];
                                                    
                                                    [NSKeyedArchiver archiveRootObject:image toFile:cachePath];
                                                } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                    
                                                }];
        }
        
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
    [self performSelector:@selector(sendTouchEvent) withObject:nil afterDelay:.2];
}

- (void)sendTouchEvent
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    self.touchedHandle(self);
}

- (void)dealloc
{
    NSLog(@"released");
}
@end
