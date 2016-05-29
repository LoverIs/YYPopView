//
//  YYPopModel.h
//  每家美物
//
//  Created by yangli on 16/5/21.
//  Copyright © 2016年 天汇联合. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYPopModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)popWithDict:(NSDictionary *)dict;

@end
