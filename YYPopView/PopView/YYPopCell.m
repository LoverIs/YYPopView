//
//  YYPopCell.m
//  每家美物
//
//  Created by yangli on 16/5/21.
//  Copyright © 2016年 天汇联合. All rights reserved.
//

#import "YYPopCell.h"
#import "YYPopModel.h"

@interface YYPopCell ()

@property (nonatomic, weak) UILabel *nameLabel;

@property (nonatomic, strong) MASConstraint *nameLabelRight;

@property (nonatomic, weak) UIImageView *iconView;

@end

@implementation YYPopCell

static NSString *reuseID = @"popCell";

+ (instancetype)loadPopCell:(UITableView *)tableView {

    YYPopCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[YYPopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        cell.backgroundView = [[UIView alloc] init];
        cell.backgroundView.backgroundColor = KPurpleColor;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
   
    UILabel *nameLable = [[UILabel alloc] init];
    nameLable.textAlignment = NSTextAlignmentCenter;
    nameLable.font = [UIFont systemFontOfSize:13];
    nameLable.textColor = [UIColor whiteColor];
    [self.contentView addSubview:nameLable];
    
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lineView];
    
    self.iconView = iconView;
    self.lineView = lineView;
    self.nameLabel = nameLable;
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_centerX).offset(20);
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(25, 25)]);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView);
        self.nameLabelRight = make.right.equalTo(self.iconView.mas_left);
    }];
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.equalTo(@1);
    }];
}

- (void)setPopModel:(YYPopModel *)popModel {
    
    _popModel = popModel;
    self.nameLabel.text = popModel.title;
   
    [self.nameLabelRight uninstall];
    
    if ([popModel.icon isEqualToString:@"没有图片"]) {
        
        [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            self.nameLabelRight = make.right.equalTo(self.contentView);
        }];
        self.iconView.hidden = YES;
        self.iconView.image = nil;

    } else {
        [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            self.nameLabelRight = make.right.equalTo(self.iconView.mas_left);
        }];
        self.iconView.hidden = NO;
        self.iconView.image = [UIImage imageNamed:popModel.icon];
    }
}

@end
