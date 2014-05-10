//
//  MainViewController.m
//  ShareCiti
//
//  Created by Ben on 2014/5/9.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "UIImage+Crop.h"
#import "ImageViewController.h"
#import <UIImage+ReSize.h>

@interface MainViewController ()<UIScrollViewDelegate>

@property(nonatomic, weak)MainView  *mainView;

@end

@implementation MainViewController

-(void)loadView
{
    MainView *mainView = [[MainView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = mainView;
    self.mainView = mainView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.mainView.startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];

     self.mainView.imageView.image = self.image;
    //self.mainView.imageView.image = [UIImage imageNamed:@"Photo"];
    self.mainView.emotionLayer.emotions = @[@"e1", @"e2", @"e3"];
    self.mainView.emotionLayer.delegate = self;
    self.currentIndex = 1;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


-(IBAction)startAction:(id)sender
{
    NSLog(@"Start");
    
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    
    CGFloat squreWidth = 200;
    
    CGRect frame = CGRectMake(0.5*(width - squreWidth), 0.5*(height - squreWidth), squreWidth, squreWidth);
    
    UIImage *resizeImage = [UIImage  imageWithImage:self.mainView.imageView.image scaledToSize:CGSizeMake(width, height)];
    UIImage *cropImage  = [resizeImage crop:frame];
    
    //UIImage *combinedImage = [self imageByCombiningImage:cropImage withImage:[UIImage imageNamed:@"sad"]];
    ImageViewController *ivc = [[ImageViewController alloc] init];
    ivc.image = cropImage;
    ivc.index = self.currentIndex;
    
    [self presentViewController:ivc animated:YES completion:^{
        
    }];
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.x;
    
    NSInteger index = offset/self.view.frame.size.width;
    
    self.currentIndex = index+1;
    
}



@end
