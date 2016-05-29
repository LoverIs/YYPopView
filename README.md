# YYPopView
touch or click button can pop a menuView. support custom with plist

// 1.根据自己的需要在YYPopModel.plist改变图片名和标题
// 2.在需要用到popView的控制器里定义一个数组并懒加载,用于初始化popView
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

//3.根据自己的需要,showpoint自己设置
//4.block回调popViewCell点击事件
//5.调用[pop show];
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    CGPoint point = CGPointMake(KScreenBounds.size.width - 27,64 - kArrowHeight);
    YYPopView *pop = [[YYPopView alloc] initWithPoint:point titles:self.resources];
    
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"%ld",index);
    };
    [pop show];
}
