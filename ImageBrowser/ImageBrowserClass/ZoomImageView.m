//
//  ScaleImageView.m
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import "ZoomImageView.h"

@interface ZoomImageView ()

@property (nonatomic, strong) UIImageView *scaleImageView;
@property (nonatomic)         CGFloat     currentScale;
@property (nonatomic)         CGFloat     lastScale;

@end

@implementation ZoomImageView

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognizerChanged:)];
        
        self.scaleImageView = [[UIImageView alloc] initWithImage:image];
        self.scaleImageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        self.scaleImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.scaleImageView.userInteractionEnabled = YES;
        self.scaleImageView.center = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2);
        [self addSubview:self.scaleImageView];
        
        [self.scaleImageView addGestureRecognizer:pinch];
        
        self.currentScale = 1.0;
        self.minScale = 1.0;
        self.maxScale = 1.0;
        
        self.clipsToBounds = YES;
        
    }
    return self;
}

- (void)pinchGestureRecognizerChanged:(UIPinchGestureRecognizer *)gesture
{
    CGFloat curZoom = self.currentScale;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.lastScale = gesture.scale;
    }
    
    if (gesture.state == UIGestureRecognizerStateChanged) {
        NSLog(@"changed: %f",gesture.scale);
        if (self.lastScale < gesture.scale) {//zooming +
            curZoom += .25;
        }else if(self.lastScale > gesture.scale){
            curZoom -= .25;
        }
        
        if (curZoom > self.maxScale || curZoom < self.minScale) return;
        
        
        self.currentScale = curZoom;
        self.lastScale = gesture.scale;
    }
    
    self.scaleImageView.bounds = CGRectMake(0, 0, self.scaleImageView.image.size.width * self.currentScale, self.scaleImageView.image.size.width * self.currentScale);
}
@end
