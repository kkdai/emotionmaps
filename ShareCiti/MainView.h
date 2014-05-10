//
//  MainView.h
//  ShareCiti
//
//  Created by Ben on 2014/5/9.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIView+LayoutHelper.h>
#import "EmotionView.h"

@interface MainView : UIView

@property(nonatomic, weak)UIButton  *startButton;
@property(nonatomic, weak)UIImageView   *imageView;
@property(nonatomic, weak)EmotionView   *emotionLayer;


@end
