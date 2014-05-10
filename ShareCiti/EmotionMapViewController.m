//
//  EmotionMapViewController.m
//  ShareCiti
//
//  Created by Ben on 2014/5/10.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import "EmotionMapViewController.h"
#import "PlaceViewController.h"

@interface EmotionMapViewController ()<UIScrollViewDelegate>

@end

@implementation EmotionMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    
    UIScrollView *sv = [[UIScrollView alloc] init];
    sv.frame = CGRectMake(0, 0, width, height);
    [self.view addSubview:sv];
    self.scrollVIew = sv;
    
    self.scrollVIew.minimumZoomScale=0.5;
    self.scrollVIew.maximumZoomScale=6.0;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map"]];
    imageView.userInteractionEnabled = YES;
    [imageView sizeToFit];
    [self.scrollVIew addSubview:imageView];
    self.scrollVIew.contentSize = CGSizeMake(imageView.frame.size.width, imageView.frame.size.height);
    self.imageView = imageView;
    
    self.scrollVIew.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:tap];
    
}

-(IBAction)tapAction:(id)sender
{
    PlaceViewController *pvc = [[PlaceViewController alloc] init];
    [self presentViewController:pvc animated:YES completion:nil];

}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
