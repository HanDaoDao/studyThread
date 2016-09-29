//
//  ViewController.m
//  studyThread
//
//  Created by 韩钊 on 16/9/12.
//  Copyright © 2016年 韩钊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSThread *thread;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showImage:(id)sender {
    
    NSString *url = @"http://ppt.downhot.com/d/file/p/2014/07/24/e8660d99f4cf021d4f0fc80b11902779.jpg";
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImageFormURL:) object:url];
    [thread start];
}

//定义一个方法作为线程的执行体
-(void)downloadImageFormURL:(NSString *)url{
    //从网络获取数据
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    
    UIImage *image = [[UIImage alloc] initWithData:data];
    if (image != nil) {
        //在主线程中执行updateUI：的方法
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
    }
    else{
        NSLog(@"----下载图片出现错误----");
    }
}

-(void)updateUI:(UIImage *)image{
    self.iv.image = image;
}
@end
