ImageBrowser
============

ImageBrowser是一个图片浏览demo，具有iPhone自带图片工具的浏览和缩放功能。iPhone自带图片浏览工具每页只能显示一个图片，本demo用户可以随意配置每页显示的图片个数，并支持自动旋转。

用法很简单：
    ImageBrowserView *browser = [[ImageBrowserView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),  CGRectGetHeight(self.view.frame))
                                                             imageNames:[NSArray arrayWithObjects:@"tset",@"tset",@"tset",@"tset",nil]];
    browser.imageCountPerPage = 3;
    browser.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:browser];


下一步完善点：
1）添加全屏属性；
2）添加网络图片支持；

