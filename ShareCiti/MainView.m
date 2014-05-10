//
//  MainView.m
//  ShareCiti
//
//  Created by Ben on 2014/5/9.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [UIImageView createInView:self];
        self.emotionLayer = [EmotionView createInView:self];
        
        self.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
        
        self.startButton = [UIButton createInView:self];
        [self.startButton setTitle:@"Create" forState:UIControlStateNormal];
        self.startButton.backgroundColor = [UIColor redColor];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    [self.startButton sizeToFit];
    
    CGFloat buttonWidth = CGRectGetWidth(self.startButton.frame) + 50;
    self.startButton.frame = CGRectMake(0, 0, buttonWidth, buttonWidth);
    
    self.startButton.center = CGPointMake(0.5*CGRectGetWidth(self.frame), height - 0.5*CGRectGetHeight(self.startButton.frame) - 20);
    
    self.startButton.layer.cornerRadius = 0.5*CGRectGetWidth(self.startButton.frame);

    
    
    
    self.imageView.frame = CGRectMake(0, 0, width, height);
    self.emotionLayer.frame = CGRectMake(0, 0, width, height);
}

@end
