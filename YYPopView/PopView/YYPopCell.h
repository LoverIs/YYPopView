//
//  YYPopCell.h
//  每家美物
//
//  Created by yangli on 16/5/21.
//  Copyright © 2016年 天汇联合. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYPopModel;

@interface YYPopCell : UITableViewCell

@property (nonatomic, strong) YYPopModel *popModel;

@property (nonatomic, weak) UIView *lineView;

+ (instancetype)loadPopCell:(UITableView *)tableView;

@end
