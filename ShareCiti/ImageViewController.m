//
//  ImageViewController.m
//  ShareCiti
//
//  Created by Ben on 2014/5/10.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import "ImageViewController.h"
#import "EmotionMapViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

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
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *eimageView = [[UIImageView alloc] init];
    [self.imageView addSubview:eimageView];
    self.eImageView = eimageView;
    
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.imageView.image = self.image;
    [self.imageView sizeToFit];
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame);
    self.imageView.frame = CGRectMake(0, 0, 100, 100);
    
    self.imageView.layer.cornerRadius = 0.5*CGRectGetWidth(self.imageView.frame);
    self.imageView.clipsToBounds = YES;
    self.imageView.center = CGPointMake(0.5*width, 40 + 0.5*CGRectGetHeight(self.imageView.frame));
    
    
    self.eImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.imageView.frame), CGRectGetHeight(self.imageView.frame));
    self.eImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"e%d", self.index]];
    self.eImageView.layer.opacity = 0.4;
    
    UIImageView *bbImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bb"]];
    
    bbImageView.frame = CGRectMake(0, 0, 320, 320*bbImageView.image.size.height/bbImageView.image.size.width);
    [self.view addSubview:bbImageView];
    
    bbImageView.center = CGPointMake(bbImageView.center.x, bbImageView.center.y + 200);

    
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.text = @"共創城市";
    [titleView sizeToFit];
    titleView.center = CGPointMake(0.5*width, CGRectGetMaxY(self.imageView.frame) + 15);
    [self.view addSubview:titleView];
    
    UILabel *dtitleView = [[UILabel alloc] initWithFrame:CGRectZero];
    dtitleView.text = @"just right now";
    dtitleView.font = [UIFont fontWithName:dtitleView.font.fontName size:12];
    [dtitleView sizeToFit];
    dtitleView.center = CGPointMake(0.5*width, CGRectGetMaxY(titleView.frame) + 15);
    [self.view addSubview:dtitleView];
    
    UIImageView *colorV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"color"]];
    colorV.frame = CGRectMake(0, 0, 320, 320*colorV.image.size.height/colorV.image.size.width);
    [self.view addSubview:colorV];
    colorV.center = CGPointMake(colorV.center.x, colorV.center.y - 10);


    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 60)];
    button.backgroundColor = [UIColor colorWithRed:1.00 green:0.04 blue:0.16 alpha:1.0];
    [self.view addSubview:button];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.center = CGPointMake(0.5*width, height - 0.5*CGRectGetHeight(button.frame));
    [button setTitle:@"Explore" forState:UIControlStateNormal];

    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)buttonAction:(id)sender
{
    EmotionMapViewController *evc = [[EmotionMapViewController alloc] init];
    [self presentViewController:evc animated:YES completion:nil];
}

@end
