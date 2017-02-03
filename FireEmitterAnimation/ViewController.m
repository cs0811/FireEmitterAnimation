//
//  ViewController.m
//  FireEmitterAnimation
//
//  Created by tongxuan on 17/2/3.
//  Copyright © 2017年 tongxuan. All rights reserved.
//

#import "ViewController.h"
#import "FireEmitterAnimationView.h"

@interface ViewController ()
@property (nonatomic, strong) FireEmitterAnimationView * animationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.animationView = [FireEmitterAnimationView new];
    self.animationView.frame = self.view.bounds;
    [self.view addSubview:self.animationView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
