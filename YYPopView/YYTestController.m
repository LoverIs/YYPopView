//
//  YYTestController.m
//  YYPopView
//
//  Created by yangli on 16/5/29.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "YYTestController.h"
#import "YYPopView.h"
#import "YYPopModel.h"

@interface YYTestController ()

@property (nonatomic, strong) NSArray *resources;

@end

@implementation YYTestController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    CGPoint point = CGPointMake(KScreenBounds.size.width - 27,64 - kArrowHeight);
    YYPopView *pop = [[YYPopView alloc] initWithPoint:point titles:self.resources];
    
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"%ld",index);
    };
    [pop show];
}

- (NSArray *)resources {
    if (!_resources) {
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"YYPopModel.plist" ofType:nil]];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            YYPopModel *modle = [YYPopModel popWithDict:dict];
            [tempArray addObject:modle];
        }
        _resources = tempArray.copy;
    }
    return _resources;
}

@end
