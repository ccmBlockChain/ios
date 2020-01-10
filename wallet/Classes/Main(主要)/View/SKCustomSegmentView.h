//
//  SKCustomSegmentView.h
//  Business
//
//  Created by talking　 on 2018/8/15.
//  Copyright © 2018年 talking　. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKCustomSegmentView : UIView

- (instancetype)initWithItemTitles:(NSArray *)itemTitles;

/**
 *  从0开始
 */
@property (nonatomic, copy) void(^SKCustomSegmentViewBtnClickHandle)(SKCustomSegmentView *segment, NSString *currentTitle, NSInteger currentIndex);

- (void)clickDefault;


@end
