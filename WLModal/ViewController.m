//
//  ViewController.m
//  WLModal
//
//  Created by 刘光强 on 2018/5/9.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ViewController.h"
#import "WLModal.h"
#import "WLPurchaseInvoiceStepModal.h"
#import "WLInvoiceQrModal.h"
#import "WLAlertModal.h"
#import "WLTitleModal.h"
#import "WLTitleWithContentModal.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 300, self.view.frame.size.width - 160, 50)];
    testButton.backgroundColor = [UIColor lightGrayColor];
    [testButton setTitle:@"点击按钮" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(clickedTestButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
}

- (void)clickedTestButton {
    WLModal *alertView = [[WLModal alloc] init];
    [alertView addContentView:[self addSubView]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"暂不开通", @"确认开通", nil]];
    [alertView setOnButtonTouchUpInside:^(WLModal *alertView, NSInteger buttonIndex) {
        NSLog(@"Block: Button at position %ld is clicked on alertView %ld.", buttonIndex, (NSInteger)[alertView tag]);
        [alertView close];
    }];
    [alertView show];
}

- (UIView *)addSubView {
    WLTitleWithContentModal *modal = [[WLTitleWithContentModal alloc] initWithTitle:@"暂不开通暂不开通" content:@"暂不开通暂不开通暂不开通暂不开通暂不开通暂不开通暂不开通暂不开通暂不开通暂不开通"];
    return modal;
}

@end
