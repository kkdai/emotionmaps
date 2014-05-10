//
//  EmotionView.m
//  ShareCiti
//
//  Created by Ben on 2014/5/10.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import "EmotionView.h"

@implementation EmotionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.emotionViews = [[NSMutableArray alloc] init];
        self.pagingEnabled = YES;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    for(int i=0; i < emotions.count; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.emotionViews addObject:button];
        [self addSubview:button];
        button.layer.opacity = 0.4;
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger index = 0;

    for(UIButton *button in self.emotionViews)
    {
        NSString *fileName = [self.emotions objectAtIndex:index];
        button.frame = CGRectMake(0, 0, 200, 200);
        CGFloat marign = self.frame.size.width - CGRectGetWidth(button.frame);
        
        button.center = CGPointMake(index*self.frame.size.width + 0.5*marign+0.5*CGRectGetWidth(button.frame), 0.5*CGRectGetHeight(self.frame));
      
        
        button.center = CGPointMake(marign*(index+0.5)+ (index+0.5)*CGRectGetWidth(button.frame), 0.5*CGRectGetHeight(self.frame));
        [button setImage:[UIImage imageNamed:fileName] forState:UIControlStateNormal];
        index++;
    }
    
    //
    self.contentSize = CGSizeMake(CGRectGetWidth(self.frame)*self.emotionViews.count, CGRectGetHeight(self.frame));
    
}



@end
