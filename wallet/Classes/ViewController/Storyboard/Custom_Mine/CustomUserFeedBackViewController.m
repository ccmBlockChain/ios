//
//  CustomUserFeedBackViewController.m
//  wallet
//
//  Created by 曾云 on 2019/8/18.
//  Copyright © 2019 talking　. All rights reserved.
//

#import "CustomUserFeedBackViewController.h"
#import "ZWWTextView.h"
@interface CustomUserFeedBackViewController ()
@property (weak, nonatomic) IBOutlet UITextField *choose;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet ZWWTextView *textView;

@end

@implementation CustomUserFeedBackViewController

- (IBAction)chooseItem:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择意见反馈类型" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"如何快速查询转账交易状态?" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.choose.text = action.title;
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"转账失败是什么原因?" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.choose.text = action.title;
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"为什么转账失败也会扣除矿工费?" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.choose.text = action.title;
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"转账时填错地址怎么办?" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.choose.text = action.title;
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"交易到账，但不显示怎么办?" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.choose.text = action.title;
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)finishButtonClick:(UIButton *)sender {
    if (![SKUtils isValidateMobile:self.mobile.text]) {
        [MBProgressHUD showMessage:@"输入正确的手机号码"];
        return;
    }
    [CFQCommonServer cfqServerQYAPIAddFeedback_Name:self.name.text mobile:self.mobile.text type:self.choose.text text:self.textView.text complete:^(NSString * _Nonnull errMsg) {
        if (errMsg) {
            [MBProgressHUD showMessage:errMsg];
        } else {
            [MBProgressHUD showMessage:@"意见提交成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [super back];
            });
        }
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用户反馈";
    [self leftBarButtomItemWithNormalName:@"icon_return_black" highName:@"icon_return_black" selector:@selector(back) target:self];
    self.textView.placeholderStr = @"请输入文字";
}

@end
