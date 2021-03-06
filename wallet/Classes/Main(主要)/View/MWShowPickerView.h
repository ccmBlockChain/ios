//
//  MWShowPickerView.h
//  mishuwork
//
//  Created by iMac on 2018/10/18.
//  Copyright © 2018 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWShowPickerView : UIView
+ (instancetype)showWithDataArr:(NSArray *)dataArr title:(NSString *)title select:(NSString *)select callback:(void(^)(NSString *string))callback;
+ (instancetype)showWithDataArr:(NSArray *)dataArr select:(NSString *)select callback:(void(^)(NSString *string))callback;
@end

NS_ASSUME_NONNULL_END
