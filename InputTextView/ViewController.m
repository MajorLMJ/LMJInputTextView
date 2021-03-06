//
//  ViewController.m
//  InputTextView
//
//  Created by MajorLi on 16/1/21.
//  Copyright © 2016年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "ViewController.h"

#import "LMJInputTextView.h"

@interface ViewController () <LMJInputTextViewDelegate>
{
    LMJInputTextView * _inputTextView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createInputTextView];
}

- (void)createInputTextView{
    _inputTextView = [[LMJInputTextView alloc] initWithFrame:CGRectMake(20, 50, [UIScreen mainScreen].bounds.size.width - 40, 200)];
    _inputTextView.contentInsets          = UIEdgeInsetsMake(10, 20, 0, 20);
    _inputTextView.backgroundColor        = [UIColor lightGrayColor];
    _inputTextView.textColor              = [UIColor greenColor];
    _inputTextView.placeholder            = @"请在这里输入字符串";
    _inputTextView.placeholderColor       = [UIColor redColor];
    _inputTextView.inputReturnHideKeybord = YES;
    _inputTextView.delegate               = self;
    _inputTextView.font                   = [UIFont boldSystemFontOfSize:20];
    
    [self.view addSubview:_inputTextView];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 300, 80, 30)];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"打印" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(printTextViewText) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


- (void)printTextViewText{
    NSLog(@"Text:%@",_inputTextView.text);
}



#pragma mark - LMJInputTextView Delegate

- (void)inputTextView:(LMJInputTextView *)inputTextView didBeginEditingWithCurrentText:(NSString *)text{
    NSLog(@"begin:%@",text);
}

- (void)inputTextView:(LMJInputTextView *)inputTextView didChangeWithCurrentText:(NSString *)text{
    NSLog(@"change:%@",text);
}

- (void)inputTextView:(LMJInputTextView *)inputTextView didEndEditingWithCurrentText:(NSString *)text{
    NSLog(@"end:%@",text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
