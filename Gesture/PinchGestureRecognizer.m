//
//  PinchGestureRecognizer.m
//  Gesture
//
//  Created by bytedance on 2021/12/15.
//

#import "PinchGestureRecognizer.h"

@interface PinchGestureRecognizer ()
@property(nonatomic,strong)UIView *testView;
@end

@implementation PinchGestureRecognizer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _testView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 314, 500)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    [self gesture];
}

-(void)gesture{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
   [_testView addGestureRecognizer:pinch];
}
#pragma mark pinch 捏合手势事件
-(void)pinchView:(UIPinchGestureRecognizer *)sender{
    //scale 缩放比例
//    sender.view.transform = CGAffineTransformMake(sender.scale, 0, 0, sender.scale, 0, 0);
    //每次缩放以原来位置为标准
//    sender.view.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
   
    //每次缩放以上一次为标准
    sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale);
    //重新设置缩放比例 1是正常缩放.小于1时是缩小(无论何种操作都是缩小),大于1时是放大(无论何种操作都是放大)
    sender.scale = 1;
   
}
@end
