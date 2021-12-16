//
//  TapGestureRecognizerViewController.m
//  Gesture
//
//  Created by bytedance on 2021/12/14.
//

#import "TapGestureRecognizerViewController.h"

@interface TapGestureRecognizerViewController ()
@property(nonatomic,strong)UIView *testView;
@end

@implementation TapGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _testView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 314, 500)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    [self gesture];
}

#pragma mark --- UITapGestureRecognizer 轻拍手势事件 ---
-(void)gesture{
    //创建手势 使用initWithTarget:action:的方法创建
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
    tap.cancelsTouchesInView = NO;
    tap.delaysTouchesBegan = NO;
    tap.delaysTouchesEnded = NO;
    //设置属性
    //tap 手势一共两个属性，一个是设置轻拍次数，一个是设置点击手指个数
    //设置轻拍次数
    tap.numberOfTapsRequired = 1;
    //设置手指字数
    tap.numberOfTouchesRequired = 2;
    
    //别忘了添加到testView上
    [self.view addGestureRecognizer:tap];
}

-(void)tapView:(UITapGestureRecognizer *)sender{
    NSLog(@"你好啊");
    //设置轻拍事件改变testView的颜色
//    _testView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}

@end
