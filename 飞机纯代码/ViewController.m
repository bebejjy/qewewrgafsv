//
//  ViewController.m
//  飞机纯代码
//
//  Created by 闫雨轩 on 16/6/11.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"

typedef enum : NSInteger {
  CZUp = 100,
  CZDown = 101,
  CZLeft = 102,
  CZRight = 103
} CZFindTag;
@interface ViewController ()
@property(nonatomic, weak) UIButton *plane;
@end

@implementation ViewController
- (IBAction)click:(UIButton *)sender {
  CGRect rect = _plane.frame;
  switch (sender.tag) {
  case CZUp:
    NSLog(@"上");
    rect.origin.y -= 10;
    break;
  case CZDown:
    NSLog(@"下");
    rect.origin.y += 10;
    break;
  case CZLeft:
    NSLog(@"左");
    rect.origin.x -= 10;
    break;
  case CZRight:
    NSLog(@"右");
    rect.origin.x += 10;
    break;

  default:
    break;
  }
    [UIView animateWithDuration:0.5 animations:^{
        _plane.frame = rect;
    }];
  
}
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self setUi];
}
//    #设置界面
- (void)setUi {
  //    1.准备背景
  UIImage *backgroundImage = [UIImage imageNamed:@"background"];
  UIImageView *backgroundImageView =
      [[UIImageView alloc] initWithImage:backgroundImage];
  backgroundImageView.frame = self.view.frame;
  [self.view addSubview:backgroundImageView];
  //    self.view.frame = self.view.bounds;
  //    2.准备飞机
  UIImage *planeNormal = [UIImage imageNamed:@"hero1"];
  UIImage *planeHighLight = [UIImage imageNamed:@"hero2"];
  UIButton *plane = [[UIButton alloc] init];
  [plane setImage:planeNormal forState:UIControlStateNormal];
  [plane setImage:planeHighLight forState:UIControlStateHighlighted];
  [plane sizeToFit];
  plane.center = self.view.center;
  [self.view addSubview:plane];
  _plane = plane;
  //     [self setupActionButtons];

  //    3.准备按钮
  //    向上的按钮
  NSInteger width = 40;
  UIButton *btnUp = [[UIButton alloc] init];
  UIImage *btnUpNormal = [UIImage imageNamed:@"top_normal"];
  UIImage *btnUpHighLight = [UIImage imageNamed:@"top_highlighted"];
  [btnUp setImage:btnUpNormal forState:UIControlStateNormal];
  [btnUp setImage:btnUpHighLight forState:UIControlStateHighlighted];
  CGPoint center = self.view.center;
  CGRect rect =
      CGRectMake(center.x - width * 0.5, center.y - width * 0.5, width, width);
  //    rect.origin.x += 80;
  rect.origin.y += 150;
  btnUp.frame = rect;
  [self.view addSubview:btnUp];
  btnUp.tag = CZUp;
  [btnUp addTarget:self
                action:@selector(click:)
      forControlEvents:UIControlEventTouchUpInside];

  UIButton *btnDown = [[UIButton alloc] init];
  UIImage *btnDownNormal = [UIImage imageNamed:@"bottom_normal"];
  UIImage *btnDownHighLight = [UIImage imageNamed:@"bottom_highlighted"];
  [btnDown setImage:btnDownNormal forState:UIControlStateNormal];
  [btnDown setImage:btnDownHighLight forState:UIControlStateHighlighted];
  rect.origin.y += 75;
  btnDown.frame = rect;
  [self.view addSubview:btnDown];
  btnDown.tag = CZDown;
  [btnDown addTarget:self
                action:@selector(click:)
      forControlEvents:UIControlEventTouchUpInside];

  UIButton *btnLeft = [[UIButton alloc] init];
  UIImage *btnLeftNormal = [UIImage imageNamed:@"left_normal"];
  UIImage *btnLeftHighLight = [UIImage imageNamed:@"left_highlighted"];
  [btnLeft setImage:btnLeftNormal forState:UIControlStateNormal];
  [btnLeft setImage:btnLeftHighLight forState:UIControlStateHighlighted];
  rect.origin.x -= width;
  rect.origin.y -= width;
  btnLeft.frame = rect;
  [self.view addSubview:btnLeft];
  btnLeft.tag = CZLeft;
  [btnLeft addTarget:self
                action:@selector(click:)
      forControlEvents:UIControlEventTouchUpInside];

  UIButton *btnRight = [[UIButton alloc] init];
  UIImage *btnRightNormal = [UIImage imageNamed:@"right_normal"];
  UIImage *btnRightHighLight = [UIImage imageNamed:@"right_highlighted"];
  [btnRight setImage:btnRightNormal forState:UIControlStateNormal];
  [btnRight setImage:btnRightHighLight forState:UIControlStateHighlighted];
  rect.origin.x += width * 2;
  //  rect.origin.y -= width;
  btnRight.frame = rect;
  [self.view addSubview:btnRight];
  btnRight.tag = CZRight;
  [btnRight addTarget:self
                action:@selector(click:)
      forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
