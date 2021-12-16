//
//  RotationGestureRecognizer.m
//  Gesture
//
//  Created by bytedance on 2021/12/15.
//

#import "RotationGestureRecognizer.h"

@interface RotationGestureRecognizer ()
@property(nonatomic,strong)UIView *testView;
@end

@implementation RotationGestureRecognizer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _testView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 314, 500)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    [self gesture];
}

-(void)gesture{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationView:)];
       
    [_testView addGestureRecognizer:rotation];
}
-(void)rotationView:(UIRotationGestureRecognizer *)sender{
//    sender.view.transform = CGAffineTransformMake(cos(M_PI_4), sin(M_PI_4), -sin(M_PI_4), cos(M_PI_4), 0, 0);
    //捏合手势两种改变方式
    //以原来的位置为标准
//    sender.view.transform = CGAffineTransformMakeRotation(sender.rotation);//rotation 是旋转角度
    
    //两个参数,以上位置为标准
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    //消除增量
    sender.rotation = 0.0;
    
}@end
