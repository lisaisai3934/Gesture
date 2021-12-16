//
//  PanGestureRecognizer.m
//  Gesture
//
//  Created by bytedance on 2021/12/14.
//

#import "PanGestureRecognizer.h"

@interface PanGestureRecognizer ()
@property(nonatomic,strong)UIView *testView;
@end

@implementation PanGestureRecognizer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _testView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 314, 500)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    [self gesture];
}

-(void)gesture{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    pan.cancelsTouchesInView = YES;
    pan.minimumNumberOfTouches = 1;
    [_testView addGestureRecognizer:pan];
}
#pragma mark pan   平移手势事件
-(void)panView:(UIPanGestureRecognizer *)sender{
    CGPoint point = [sender translationInView:_testView];
    //平移一共两种移动方式
    //第一种移动方法:每次移动都是从原来的位置移动
//    sender.view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    
    //第二种移动方式:以上次的位置为标准(移动方式 第二次移动加上第一次移动量)
    sender.view.transform = CGAffineTransformTranslate(sender.view.transform, point.x, point.y);
    //增量置为o
    [sender setTranslation:CGPointZero inView:sender.view];
    
     _testView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchMoved");
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchCancel");
}
@end
