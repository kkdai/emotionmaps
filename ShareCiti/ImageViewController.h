//
//  ImageViewController.h
//  ShareCiti
//
//  Created by Ben on 2014/5/10.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController


@property(nonatomic, weak)UIImageView *imageView;
@property(nonatomic, strong)UIImage     *image;
@property(nonatomic, weak)UIImageView   *eImageView;
@property(nonatomic, weak)UIImage       *emotionImage;


@property(nonatomic, weak)UIButton      *button;

@property(nonatomic, assign)NSInteger   index;

@end
