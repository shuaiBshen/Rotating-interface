//
//  WebViewController.m
//  webCache
//
//  Created by 申帅 on 16/4/14.
//  Copyright © 2016年 申帅. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

#define loadUrl @"https://wap.baidu.com/"


@implementation WebViewController{
    BOOL isTranstrom;//是否要转屏
}



- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:loadUrl]];
    [_webView loadRequest:request];
    // Do any additional setup after loading the view.
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"加载完成");
}

- (IBAction)touch:(id)sender {
    //旋转屏幕
    isTranstrom = !isTranstrom;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val;
        if (isTranstrom) {
            val = UIInterfaceOrientationLandscapeRight;
        } else {
            val = UIInterfaceOrientationPortrait;
        }
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"错误:%@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
