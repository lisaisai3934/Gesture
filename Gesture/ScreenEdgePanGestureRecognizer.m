//
//  ScreenEdgePanGestureRecognizer.m
//  Gesture
//
//  Created by bytedance on 2021/12/14.
//

#import "ScreenEdgePanGestureRecognizer.h"

@interface ScreenEdgePanGestureRecognizer ()
@property(nonatomic,strong)UIView *testView;
@end

@implementation ScreenEdgePanGestureRecognizer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    _testView = [[UIView alloc]initWithFrame:CGRectMake(100, 0, self.view.bounds.size.width, 100)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    [self gesture];
}
-(void)gesture{
    UIScreenEdgePanGestureRecognizer *screenEdgeRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgeDetected:)];
    /*设置边缘起点*/
    screenEdgeRecognizer.edges = UIRectEdgeLeft;
    [_testView addGestureRecognizer: screenEdgeRecognizer];
}
#pragma mark screenEdgePan 屏幕边界平移事件
/*方法实现*/
-(void) screenEdgeDetected :(UIScreenEdgePanGestureRecognizer *)screenEdge
{
   /*获取拖动的位置*/
    CGPoint point = [screenEdge translationInView:screenEdge.view];
   /*每次都以传入的translation为起始参照*/
    screenEdge.view.transform = CGAffineTransformTranslate(screenEdge.view.transform, point.x, 0);
   /*设置当前拖动的位置*/
    [screenEdge setTranslation:CGPointZero inView:screenEdge.view];
}
@end
