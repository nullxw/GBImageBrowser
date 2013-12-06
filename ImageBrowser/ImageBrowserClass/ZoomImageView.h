//
//  ScaleImageView.h
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomImageView : UIView<UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame
              image:(NSURL *)image
        touchHandle:(void(^)(ZoomImageView *))touched;

@end
