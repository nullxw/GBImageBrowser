//
//  ScaleImageView.h
//  ImageBrowser
//
//  Created by yixiaoluo on 13-8-4.
//  Copyright (c) 2013年 yixiaoluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomImageView : UIView

@property (nonatomic) CGFloat maxScale;
@property (nonatomic) CGFloat minScale;

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image;

- (id)initWithFrame:(CGRect)frame url:(NSString *)url;

@end
