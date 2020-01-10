//
//  CustomMineModel.m
//  wallet
//
//  Created by 曾云 on 2019/8/17.
//  Copyright © 2019 talking　. All rights reserved.
//

#import "CustomMineModel.h"


@implementation CustomMineItemModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"";
        _count = 0;
        self.objc_Height = 44.0f;
        self.objc_Identifier = @"Identifier_CustomMine";
        _type = CustomMineItemType_NotificationCenter;
        [[RACObserve(self, type)distinctUntilChanged]subscribeNext:^(id  _Nullable x) {
            switch ([x integerValue]) {
                case CustomMineItemType_NotificationCenter:
                {
                    self.title = @"通知中心";
                    
                }
                    break;
                    
                case CustomMineItemType_UserFeedback:
                {
                    self.title = @"用户反馈";
                }
                    break;
                    
                    
                case CustomMineItemType_ModifyPassword:
                {
                    self.title = @"修改密码";
                }
                    break;
                    
                case CustomMineItemType_UserAgreement:
                {
                    self.title = @"用户协议";
                }
                    break;
                    
                case CustomMineItemType_AboutMe:
                {
                    self.title = @"关于我们";
                }
                    break;
                    
                case CustomMineItemType_Version:
                {
                    self.title = @"当前版本";
                }
                    break;
                case CustomMineItemType_LoginOut:
                {
                    self.title = @"退出登录";
                }
                    break;
                    
                default:
                    break;
            }
        }];
        
    }
    return self;
}
- (instancetype)initWithType:(CustomMineItemType)type
{
    self = [self init];
    if (self) {
        self.type = type;
    }
    return self;
}

@end

@implementation CustomMineSectionModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header_Height = 30.0f;
        _title = @"";
        _imgName = @"";
        _type = CustomMineSectionType_Setup;
        [[RACObserve(self, type)distinctUntilChanged]subscribeNext:^(id  _Nullable x) {
            [self.itemArray removeAllObjects];
            switch ([x integerValue]) {
                case CustomMineSectionType_Setup:
                {
                    self.title = @"基本设置";
                    self.imgName = @"user_icon_set";
                    [self.itemArray addObject:[[CustomMineItemModel alloc]initWithType:CustomMineItemType_NotificationCenter]];
                    [self.itemArray addObject:[[CustomMineItemModel alloc]initWithType:CustomMineItemType_UserFeedback]];
                    
                    
                }
                    break;
                    
                case CustomMineSectionType_Security:
                {
                    self.title = @"安全中心";
                    self.imgName = @"user_icon_security";
                     [self.itemArray addObject:[[CustomMineItemModel alloc]initWithType:CustomMineItemType_ModifyPassword]];
                }
                    break;
                    
                    
                case CustomMineSectionType_FocusMe:
                {
                    self.title = @"关注我们";
                    self.imgName = @"user_icon_us";
                     [self.itemArray addObject:[[CustomMineItemModel alloc]initWithType:CustomMineItemType_UserAgreement]];
                     [self.itemArray addObject:[[CustomMineItemModel alloc]initWithType:CustomMineItemType_AboutMe]];
                     [self.itemArray addObject:[[CustomMineItemModel alloc]initWithType:CustomMineItemType_Version]];
                    [self.itemArray addObject:[[CustomMineItemModel alloc]initWithType:CustomMineItemType_LoginOut]];
                }
                    break;
                    
                default:
                    break;
            }
        }];
        
    }
    return self;
}
- (instancetype)initWithType:(CustomMineSectionType)type
{
    self = [self init];
    if (self) {
        self.type = type;
    }
    return self;
}

@end

@implementation CustomMineModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _walletName = @"钱包名称";
        _header_ImgName = @"head_portrait";
        _dataArray = [NSMutableArray array];
        _setup = [[CustomMineSectionModel alloc]initWithType:CustomMineSectionType_Setup];
        [_dataArray addObject:_setup];
        
        _security = [[CustomMineSectionModel alloc]initWithType:CustomMineSectionType_Security];
        [_dataArray addObject:_security];
        
        _focusMe = [[CustomMineSectionModel alloc]initWithType:CustomMineSectionType_FocusMe];
        [_dataArray addObject:_focusMe];
    }
    return self;
}
@end
