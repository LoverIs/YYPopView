//
//  YYPopModel.m
//  每家美物
//
//  Created by yangli on 16/5/21.
//  Copyright © 2016年 天汇联合. All rights reserved.
//

#import "YYPopModel.h"

@implementation YYPopModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)popWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
