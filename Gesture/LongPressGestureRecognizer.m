//
//  LongPressGestureRecognizer.m
//  Gesture
//
//  Created by bytedance on 2021/12/14.
//

#import "LongPressGestureRecognizer.h"

@interface LongPressGestureRecognizer ()
@property(nonatomic,strong)UIView *testView;
@end

@implementation LongPressGestureRecognizer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _testView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 314, 500)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    [self gesture];
    // Do any additional setup after loading the view.
}
-(void)gesture{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
        //属性设置
        //最小长按时间
        longPress.minimumPressDuration = 1;
        [_testView addGestureRecognizer:longPress];
}
#pragma mark langPress 长按手势事件
-(void)longPress:(UILongPressGestureRecognizer *)sender{
    //进行判断,在什么时候触发事件
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按状态");
//改变testView颜色
        _testView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }
}

@end
