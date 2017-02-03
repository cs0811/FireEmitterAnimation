//
//  FireEmitterAnimationView.m
//  FireEmitterAnimation
//
//  Created by tongxuan on 17/2/3.
//  Copyright © 2017年 tongxuan. All rights reserved.
//

#import "FireEmitterAnimationView.h"

@interface FireEmitterAnimationView ()
@property (nonatomic, strong) CAEmitterLayer * fireEmitter;
@end

@implementation FireEmitterAnimationView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self lodUI];
    }
    return self;
}

- (void)lodUI {
    
    self.backgroundColor = [UIColor blackColor];
//    // 发射器在xy平面的中心位置
//    self.fireEmitter.emitterPosition = self.center;
    // 发射器的尺寸大小
    //        fireEmitter.emitterSize = CGSize(width: 20, height: 60)
    // 发射器的发射模式
    //        fireEmitter.emitterMode = kCAEmitterLayerOutline
    // 发射器的形状
    self.fireEmitter.emitterShape = kCAEmitterLayerCircle;
    // 发射器渲染模式
    self.fireEmitter.renderMode = kCAEmitterLayerAdditive;

    // 发射单元 - 火焰
    CAEmitterCell * fire = [CAEmitterCell emitterCell];
    // 粒子的创建速率，默认为1/s。
    fire.birthRate = 200;
    // 粒子存活时间
    fire.lifetime = 0.2;
    // 粒子的生存时间容差
    fire.lifetimeRange = 0.5;
    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    fire.contents = (__bridge id _Nullable)([UIImage imageNamed:@"fire"].CGImage);
    fire.name = @"fire";
    // 粒子的速度
    fire.velocity = 35;
    // 粒子动画的速度容差
    fire.velocityRange = 10;
    // 粒子在xy平面的发射角度
    fire.emissionLongitude = M_PI + M_PI_2;
    // 粒子发射角度的容差
    fire.emissionRange = M_PI_2;
    // 缩放速度
    fire.scaleSpeed = 0.3;
    // 旋转度
    //        fire.spin = 0.2
    
    self.fireEmitter.emitterCells = @[fire];
    [self.layer addSublayer:self.fireEmitter];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    // 发射器在xy平面的中心位置
    self.fireEmitter.emitterPosition = self.center;
}

#pragma mark - Getter
- (CAEmitterLayer *)fireEmitter {
    if (!_fireEmitter) {
        _fireEmitter = [CAEmitterLayer new];
    }
    return _fireEmitter;
}

@end
