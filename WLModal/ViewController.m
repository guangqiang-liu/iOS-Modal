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
    
    [alertView setSubView:[self addSubView]];
    
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"暂不开通", @"确认开通", nil]];
    
    [alertView setOnButtonTouchUpInside:^(WLModal *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        [alertView close];
    }];
    
    [alertView show];
}

- (UIView *)addSubView {
    //    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260, 200)];
    //    view.text = @"我是子视图";
    //    view.backgroundColor = [UIColor magentaColor];
    //    view.textAlignment = NSTextAlignmentCenter;
    //    return view;
    
    NSString *title = @"一旦确认不可取消。确认作。";
    NSString *content = @"一旦确认不可取消。确认作废该笔发票吗？一旦确认不可取消。";
    CGFloat titleHeight = [self calculateHeightWithString:title width:272 - 70 font:H14 spacing:5];
    CGFloat contentHeight = [self calculateHeightWithString:content width:272 - 32 font:H14 spacing:5];
    
    WLAlertModal *modal = [[WLAlertModal alloc] init];
    modal.frame = CGRectMake(0, 0, 272, titleHeight + contentHeight + 50);
    modal.title = title;
    modal.content = content;
    
    return modal;
}

- (CGFloat)calculateHeightWithString:(NSString *)string width:(CGFloat)width font:(UIFont *)font spacing:(NSInteger)spacing {
    if (string.length <= 0 ) {
        return 0.1f;
    }
    CGSize size = CGSizeMake(width, 2000);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:spacing];
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
    CGFloat height = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size.height;
    return height;
}


@end
