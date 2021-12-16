//
//  SwipeGestureRecognizer.m
//  Gesture
//
//  Created by bytedance on 2021/12/14.
//

#import "SwipeGestureRecognizer.h"

@interface SwipeGestureRecognizer ()
@property(nonatomic,strong)UIView *testView;
@end

@implementation SwipeGestureRecognizer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _testView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 314, 500)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    [self gesture];
    // Do any additional setup after loading the view.
}
#pragma mark swipe轻扫手势事件
-(void)gesture{
    //创建手势
      UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
    //设置属性，swipe也是有两种属性设置手指个数及轻扫方向
    swipe.numberOfTouchesRequired = 1;
        //设置轻扫方向(默认是从左往右)
        //direction是一个枚举值有四个选项，我们可以设置从左往右，从右往左，从下往上以及从上往下
      //设置轻扫方向(默认是从左往右)
        swipe.direction = UISwipeGestureRecognizerDirectionUp;
        [_testView addGestureRecognizer:swipe];
}
-(void)swipeView:(UISwipeGestureRecognizer *)sender{
    NSLog(@"w");
    _testView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}

@end
