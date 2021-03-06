//
//  CustomNotificationCenterTableViewCell.m
//  wallet
//
//  Created by 曾云 on 2019/8/18.
//  Copyright © 2019 talking　. All rights reserved.
//

#import "CustomNotificationCenterTableViewCell.h"

@interface CustomNotificationCenterTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *details;

@end

@implementation CustomNotificationCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setItemModel:(CustomNotificationCenterItemModel *)itemModel {
    _itemModel = itemModel;
    if (_itemModel) {
        NSLog(@"tokenName0000000========%@",_itemModel.tokenName);
        if ([_itemModel.tokenName isEqualToString:@""] && [_itemModel.tokenName length] == 0) {
            self.time.textColor = [UIColor colorWithHexString:@"#999999"];
            self.details.textColor = [UIColor colorWithHexString:@"#666666"];
            self.title.textColor = [UIColor colorWithHexString:@"#333333"];
            NSString *address = [[CustomUserManager customSharedManager].userModel.ethAddress lowercaseString];
            
            
            self.time.text = [SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:_itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *hash = _itemModel.hash_K;
            if (_itemModel.hash_K.length > 10) {
                hash = [_itemModel.hash_K substringToIndex:10];
            }
            self.details.text = [NSString stringWithFormat:@"%@...,点击查看详情",hash];
            
            switch (_itemModel.type1) {
                case CustomNotificationCenterItemType_Transfer:
                {
                    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    if ([address isEqualToString:[_itemModel.from lowercaseString]]) {
                        self.title.text = @"转账失败通知";
                        if ([_itemModel.status isEqualToString:@"0x1"]) {
                            self.title.text = @"转账成功通知";
                        }
                        
                        if (_itemModel.fromReadStatus == 1) {
                            [self finish];
                            
                        }
                        
                    } else {
                        self.title.text = @"收款失败通知";
                        if ([_itemModel.status isEqualToString:@"0x1"]) {
                            self.title.text = @"收款成功通知";
                        }
                        if (_itemModel.toReadStatus == 1) {
                            //                        self.alpha = 0.38;
                            [self finish];
                        }
                        
                        
                    }
                }
                    break;
                    
                case CustomNotificationCenterItemType_System:
                {
                    self.accessoryType = UITableViewCellAccessoryNone;
                    self.title.text = _itemModel.hash_K;
                }
                    break;
                    
                default:
                    break;
            }
            
        }
        if([_itemModel.tokenName isEqualToString:@"CCM"]){
            //        self.contentView.backgroundColor = [UIColor whiteColor];
            self.time.textColor = [UIColor colorWithHexString:@"#999999"];
            self.details.textColor = [UIColor colorWithHexString:@"#666666"];
            self.title.textColor = [UIColor colorWithHexString:@"#333333"];
            NSString *address = [[CustomUserManager customSharedManager].userModel.ethAddress lowercaseString];
            
            
            self.time.text = [SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:_itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *hash = _itemModel.hash_K;
            if (_itemModel.hash_K.length > 10) {
                hash = [_itemModel.hash_K substringToIndex:10];
            }
            self.details.text = [NSString stringWithFormat:@"%@...,点击查看详情",hash];
            
            switch (_itemModel.type1) {
                case CustomNotificationCenterItemType_Transfer:
                {
                    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    if ([address isEqualToString:[_itemModel.from lowercaseString]]) {
                        self.title.text = @"转账失败通知";
                        if ([_itemModel.status isEqualToString:@"0x1"]) {
                            self.title.text = @"转账成功通知";
                        }
                        
                        if (_itemModel.fromReadStatus == 1) {
                            [self finish];
                            
                        }
                        
                    } else {
                        self.title.text = @"收款失败通知";
                        if ([_itemModel.status isEqualToString:@"0x1"]) {
                            self.title.text = @"收款成功通知";
                        }
                        if (_itemModel.toReadStatus == 1) {
                            //                        self.alpha = 0.38;
                            [self finish];
                        }
                        
                        
                    }
                }
                    break;
                    
                case CustomNotificationCenterItemType_System:
                {
                    self.accessoryType = UITableViewCellAccessoryNone;
                    self.title.text = _itemModel.hash_K;
                }
                    break;
                    
                default:
                    break;
            }
            
        }
        if ([_itemModel.type isEqualToString:@"btc"]){
            //        self.contentView.backgroundColor = [UIColor whiteColor];
            self.time.textColor = [UIColor colorWithHexString:@"#999999"];
            self.details.textColor = [UIColor colorWithHexString:@"#666666"];
            self.title.textColor = [UIColor colorWithHexString:@"#333333"];
            NSString *address = [[CustomUserManager customSharedManager].userModel.ethAddress lowercaseString];
            
            
            self.time.text = [SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:_itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *hash = _itemModel.hashO;
            if (_itemModel.hashO.length > 10) {
                hash = [_itemModel.hashO substringToIndex:10];
            }
            self.details.text = [NSString stringWithFormat:@"%@...,点击查看详情",hash];
            
            switch (_itemModel.type1) {
                case CustomNotificationCenterItemType_Transfer:
                {
                    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    if ([address isEqualToString:[_itemModel.from lowercaseString]]) {
                        self.title.text = @"转账失败通知";
                        if ([_itemModel.status  isEqual: @"1"]) {
                            self.title.text = @"转账成功通知";
                        }
                        
                        if ([_itemModel.fromreadstatus isEqual: @"1"]) {
                            [self finish];
                            
                        }
                        
                    } else {
                        self.title.text = @"收款失败通知";
                        if ([_itemModel.status isEqual:@"1"]) {
                            self.title.text = @"收款成功通知";
                        }
                        if ([_itemModel.toreadstatus  isEqual: @"1"]) {
                            //                        self.alpha = 0.38;
                            [self finish];
                        }
                        
                        
                    }
                }
                    break;
                    
                case CustomNotificationCenterItemType_System:
                {
                    self.accessoryType = UITableViewCellAccessoryNone;
                    self.title.text = _itemModel.hash_K;
                }
                    break;
                    
                default:
                    break;
            }
            
        }
        if ([_itemModel.type isEqualToString:@"eth"]){
            //        self.contentView.backgroundColor = [UIColor whiteColor];
            self.time.textColor = [UIColor colorWithHexString:@"#999999"];
            self.details.textColor = [UIColor colorWithHexString:@"#666666"];
            self.title.textColor = [UIColor colorWithHexString:@"#333333"];
            NSString *address = [[CustomUserManager customSharedManager].userModel.ethAddress lowercaseString];
            
            
            self.time.text = [SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:_itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *hash = _itemModel.hashO;
            if (_itemModel.hashO.length > 10) {
                hash = [_itemModel.hashO substringToIndex:10];
            }
            self.details.text = [NSString stringWithFormat:@"%@...,点击查看详情",hash];
            
            switch (_itemModel.type1) {
                case CustomNotificationCenterItemType_Transfer:
                {
                    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    if ([address isEqualToString:[_itemModel.from lowercaseString]]) {
                        self.title.text = @"转账失败通知";
                        if ([_itemModel.status isEqual:@"1"]) {
                            self.title.text = @"转账成功通知";
                        }
                        
                        if ([_itemModel.fromreadstatus  isEqual: @"1"]) {
                            [self finish];
                            
                        }
                        
                    } else {
                        self.title.text = @"收款失败通知";
                        if ([_itemModel.status isEqual:@"1"]) {
                            self.title.text = @"收款成功通知";
                        }
                        if ([_itemModel.toreadstatus  isEqual: @"1"]) {
                            //                        self.alpha = 0.38;
                            [self finish];
                        }
                        
                        
                    }
                }
                    break;
                    
                case CustomNotificationCenterItemType_System:
                {
                    self.accessoryType = UITableViewCellAccessoryNone;
                    self.title.text = _itemModel.hashO;
                }
                    break;
                    
                default:
                    break;
            }
            
        }

        
    }
}

- (void)finish {
//    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    self.time.textColor = [UIColor colorWithHexString:@"#999999"];
    self.details.textColor = [UIColor colorWithHexString:@"#999999"];
    self.title.textColor = [UIColor colorWithHexString:@"#999999"];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
