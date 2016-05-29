//
//  YYPopView.h
//  每家美物
//
//  Created by yangli on 16/5/20.
//  Copyright © 2016年 天汇联合. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYPopView : UIView

- (instancetype)initWithPoint:(CGPoint)point titles:(NSArray *)titles;
- (void)show;
- (void)dismiss;
- (void)dismiss:(BOOL)animated;

@property (nonatomic, copy) void (^selectRowAtIndex)(NSInteger index);

@end
