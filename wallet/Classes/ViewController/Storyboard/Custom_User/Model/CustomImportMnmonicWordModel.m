//
//  CustomImportMnmonicWordModel.m
//  wallet
//
//  Created by 曾云 on 2019/8/17.
//  Copyright © 2019 talking　. All rights reserved.
//

#import "CustomImportMnmonicWordModel.h"


@implementation CustomImportMnmonicWordItemModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _key = @"";
        _value = @"";
        _placeholder =@"";
        _isEntry = NO;
        _type = ImportMnmonicWordItemType_Name;
        self.objc_Height = 50.0f;
        self.objc_Identifier = @"Identifier_CustomImportMnmonicWord";
    }
    return self;
}

- (instancetype)initWithType:(ImportMnmonicWordItemType )type
{
    self = [self init];
    if (self) {
        self.type = type;
        switch (self.type) {
            case ImportMnmonicWordItemType_Name:
            {
                self.placeholder = @"钱包名称（最多12个字符）";
            }
                break;
                
            case ImportMnmonicWordItemType_Password:
            {
                self.placeholder = @"密码（8-32字符，需包含大小写字母及数字）";
                self.isEntry = YES;
            }
                break;
                
            case ImportMnmonicWordItemType_NewPassword:
            {
                self.placeholder = @"重复密码（8-32字符，需包含大小写字母及数字）";
            }
                break;
                
            default:
                break;
        }
    }
    return self;
}

@end

@implementation CustomImportMnmonicWordModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header_Height = 234.0f;
        self.footer_Height = 100.0f;
        _name = @"";
        _password = @"";
        _newpassword = @"";
        _name = @"CCMWallet";
//        _password = @"Zy1234567890";
//        _newpassword = @"Zy1234567890";
//        _mnmonicWord = @"across clock raise above wrestle menu say yard filter mixture path note";
        
        _dataArray = [[NSMutableArray alloc]initWithObjects:
                      [[CustomImportMnmonicWordItemModel alloc]initWithType:ImportMnmonicWordItemType_Name],
                      [[CustomImportMnmonicWordItemModel alloc]initWithType:ImportMnmonicWordItemType_Password],
                      [[CustomImportMnmonicWordItemModel alloc]initWithType:ImportMnmonicWordItemType_NewPassword], nil];
        
        
        
        _errMsg = @"";
        RAC(self,errMsg)=
        [RACSignal combineLatest:@[ [RACObserve(self,mnmonicWord) distinctUntilChanged]
                                    ,[RACObserve(self,name) distinctUntilChanged],
                                    [RACObserve(self,password) distinctUntilChanged],
                                    [RACObserve(self,newpassword) distinctUntilChanged]]
                          reduce:^(NSString *mnmonicWord,
                                   NSString *name,
                                   NSString *password,
                                   NSString *newpassword){
                              if (mnmonicWord.length == 0) {
                                  return @"请填写助记词";
                              }
                              if (name.length == 0) {
                                  return @"请输入钱包名称";
                              }
                              
                              if (name.length >12) {
                                  return @"钱包名称最多12位";
                              }
                              
                              NSString *pad = [self verifyPassWord:password];
                              if (pad.length != 0) {
                                  return pad;
                              }
                              
                              if (![password isEqualToString:newpassword]) {
                                  return @"两次不相同";
                              }
                              return @"";
                          }];
    }
    return self;
}
@end
