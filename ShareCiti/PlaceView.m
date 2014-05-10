//
//  PlaceView.m
//  ShareCiti
//
//  Created by Ben on 2014/5/10.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import "PlaceView.h"

@implementation PlaceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.imageView = [UIImageView createInView:self];
        self.titleLabel = [UILabel createInView:self];
        self.detailLabel = [UILabel createInView:self];
        self.detailLabel.font = [UIFont fontWithName:self.detailLabel.font.fontName size:12];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    
    CGFloat txtHeight = 60;

    self.imageView.frame = CGRectMake(0, 0, height - 60, height - 60);
    self.imageView.center = CGPointMake(0.5*width, 0.5*CGRectGetHeight(self.imageView.frame));
    
    [self.titleLabel sizeToFit];
    [self.detailLabel sizeToFit];
    
    self.titleLabel.center = CGPointMake(0.5*width, CGRectGetMaxY(self.imageView.frame) + 0.5*CGRectGetHeight(self.titleLabel.frame));
    self.detailLabel.center = CGPointMake(0.5*width, CGRectGetMaxY(self.titleLabel.frame) + 10 + 0.5*CGRectGetHeight(self.detailLabel.frame));
    
}


@end
