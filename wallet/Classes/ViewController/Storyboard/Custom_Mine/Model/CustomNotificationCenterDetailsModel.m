//
//  CustomNotificationCenterDetailsModel.m
//  wallet
//
//  Created by 曾云 on 2019/8/22.
//  Copyright © 2019 talking　. All rights reserved.
//

#import "CustomNotificationCenterDetailsModel.h"


@implementation CustomNotificationCenterDetailsSectionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
        _tokenName = kMNullStr;
        _gasPrice = 0.00;
    }
    return self;
}

@end




@implementation CustomNotificationCenterDetailsModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
        _tokenName = kMNullStr;
        _sendAddress = kMNullStr;
        _toAddress = kMNullStr;
        _hash_k = kMNullStr;
        _btc_eth_value = kMNullStr;
        _gas = 0;
        _gasPrice = 0;
        _timestamp = 0;
        _sectionModel = [[CustomNotificationCenterDetailsSectionModel alloc]init];
    }
    return self;
}


- (instancetype)initWithItemModel:(CustomNotificationCenterItemModel *)itemModel
{
    self = [self init];
    if (self) {
        if ([itemModel.tokenName isEqualToString:@""]&&[itemModel.tokenName length]==0) {
            _value = itemModel.realValue;
            if (itemModel.value >0) {
                _value = itemModel.value/1000000000000000000;
            }
            
            _tokenName = itemModel.tokenName;
            _sendAddress = itemModel.from;
            
            _toAddress = itemModel.to;
            if (itemModel.value >0) {
                _toAddress = itemModel.realAddress;
            }
            
            _hash_k = itemModel.hash_K;
            
            //        NSString *gas_str =  [[NSString alloc]initWithFormat:@"%f",itemModel.gas];
            //        double gas = [gas_str doubleValue]/1000000000000000000;
            _gas = (itemModel.gasPrice *itemModel.gas)/1000000000000000000;
            _gasPrice = itemModel.gasPrice/1000000000000000000*21000;
            _timestamp = itemModel.timestamp;
            
            _sectionModel.value = _value;
            _sectionModel.tokenName = _tokenName;
            _sectionModel.gasPrice  = _gasPrice;
            
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"发送地址" value:_sendAddress]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"接受地址" value:_toAddress]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"矿工费" value:[NSString stringWithFormat:@"%f ",_gasPrice]]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"区块" value:[NSString stringWithFormat:@"%ld",itemModel.blockNumber]]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易时间" value:[SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"]]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易ID" value:itemModel.hash_K]];
        }
        if ([itemModel.tokenName isEqualToString:@"CCM"]) {
            _value = itemModel.realValue;
            if (itemModel.value >0) {
                _value = itemModel.value/1000000000000000000;
            }
            
            _tokenName = itemModel.tokenName;
            _sendAddress = itemModel.from;
            
            _toAddress = itemModel.to;
            if (itemModel.value >0) {
                _toAddress = itemModel.realAddress;
            }
            
            _hash_k = itemModel.hash_K;
            
            //        NSString *gas_str =  [[NSString alloc]initWithFormat:@"%f",itemModel.gas];
            //        double gas = [gas_str doubleValue]/1000000000000000000;
            _gas = (itemModel.gasPrice *itemModel.gas)/1000000000000000000;
            _gasPrice = itemModel.gasPrice/1000000000000000000*21000;
            _timestamp = itemModel.timestamp;
            
            _sectionModel.value = _value;
            _sectionModel.tokenName = _tokenName;
            _sectionModel.gasPrice  = _gasPrice;
            
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"发送地址" value:_sendAddress]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"接受地址" value:_toAddress]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"矿工费" value:[NSString stringWithFormat:@"%f CCM",_gasPrice]]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"区块" value:[NSString stringWithFormat:@"%ld",itemModel.blockNumber]]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易时间" value:[SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"]]];
            [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易ID" value:itemModel.hash_K]];
            
        }
        if ([itemModel.type isEqualToString:@"btc"]) {
                
                _tokenName = itemModel.type;
                _sendAddress = itemModel.from;
                
                _toAddress = itemModel.to;
                if (itemModel.value >0) {
                    _toAddress = itemModel.realAddress;
                }
                
                _hashO = itemModel.hashO;
                
                NSDecimalNumber *gasprice = [[NSDecimalNumber alloc]initWithString:itemModel.fee];
                _timestamp = itemModel.timestamp;
                NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc]initWithString:itemModel.btc_eth_value];
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:[decimalNumber stringValue] forKey:@"btc"];
                [defaults synchronize];
                _sectionModel.value = [decimalNumber doubleValue];
                _sectionModel.tokenName = _tokenName;
                _sectionModel.gasPrice  = [gasprice doubleValue];
                
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"发送地址" value:_sendAddress]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"接受地址" value:_toAddress]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"矿工费" value:[NSString stringWithFormat:@"%f btc",[gasprice doubleValue]]]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"区块" value:[NSString stringWithFormat:@"%@",itemModel.blockhumber]]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易时间" value:[SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"]]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易ID" value:itemModel.hashO]];
            }
            if ([itemModel.tokenName isEqualToString:@"eth"]) {
                _value = itemModel.value;
                if (itemModel.value >0) {
                    _value = itemModel.value/1000000000000000000;
                }
                
                _tokenName = itemModel.type;
                _sendAddress = itemModel.from;
                
                _toAddress = itemModel.to;
                if (itemModel.value >0) {
                    _toAddress = itemModel.realAddress;
                }
                
                _hashO = itemModel.hashO;
                
                //        NSString *gas_str =  [[NSString alloc]initWithFormat:@"%f",itemModel.gas];
                //        double gas = [gas_str doubleValue]/1000000000000000000;
                _gas = (itemModel.gasprice *itemModel.gas)/1000000000000000000;
                _gasPrice = itemModel.gasprice/1000000000000000000*21000;
                _timestamp = itemModel.timestamp;
                
                _sectionModel.value = _value;
                _sectionModel.tokenName = _tokenName;
                _sectionModel.gasPrice  = _gasPrice;
                
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"发送地址" value:_sendAddress]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"接受地址" value:_toAddress]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"矿工费" value:[NSString stringWithFormat:@"%f eth",_gasPrice]]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"区块" value:[NSString stringWithFormat:@"%@",itemModel.blockhumber]]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易时间" value:[SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"]]];
                [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易ID" value:itemModel.hashO]];
            }
          
            
//        }
       
        
        
    }
    return self;
}


- (instancetype)initWithITransfertemModel:(CustomNotificationCenterItemModel *)itemModel {
    self = [self init];
    if (self) {
        _value = itemModel.value;
        _tokenName = itemModel.tokenName;
        _sendAddress = itemModel.from;
        _toAddress = itemModel.to;
        
        _hash_k = itemModel.hash_K;
        _gas = itemModel.gas;
        _gasPrice = itemModel.gasPrice;
        _timestamp = itemModel.timestamp;
        
        _sectionModel.value = _value;
        _sectionModel.tokenName = _tokenName;
        _sectionModel.gasPrice  = _gasPrice;
        
        [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"发送地址" value:_sendAddress]];
        [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"接受地址" value:_toAddress]];
        [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"矿工费" value:[NSString stringWithFormat:@"%f CCM",_gasPrice]]];
        [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"区块" value:[NSString stringWithFormat:@"%ld",itemModel.blockNumber]]];
        [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易时间" value:[SKUtils dateToString:[NSDate dateWithTimeIntervalSince1970:itemModel.timestamp] withDateFormat:@"yyyy-MM-dd HH:mm:ss"]]];
        [_sectionModel.itemArray addObject:[[ObjcKeyValueModel alloc]initWithKey:@"交易ID" value:itemModel.hash_K]];
        
        
        
    }
    return self;
}

@end
