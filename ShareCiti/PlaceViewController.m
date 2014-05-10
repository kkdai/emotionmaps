//
//  PlaceViewController.m
//  ShareCiti
//
//  Created by Ben on 2014/5/10.
//  Copyright (c) 2014年 ShareCiti. All rights reserved.
//

#import "PlaceViewController.h"
#import "PlaceView.h"
#import "DetailViewController.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.arr = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
    NSArray *photos = @[@"places-01", @"places-02", @"places-03", @"places-04"];
    NSArray *nameArr = @[@"臺北孔廟", @"居酒屋", @"中正紀念堂", @"sdssa"];
    NSArray *agos = @[@"1hr ago", @"18hrs ago", @"3 days ago", @"1 month ago"];
    
    NSInteger index = 0;
    for(NSString *name in photos)
    {
        PlaceView *pv = [[PlaceView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        pv.imageView.image = [UIImage imageNamed:[photos objectAtIndex:index]];
        [scrollView addSubview:pv];
        pv.titleLabel.text = [nameArr objectAtIndex:index];
        pv.detailLabel.text = [agos objectAtIndex:index];
        [self.arr addObject:pv];
        UITapGestureRecognizer *tg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [pv addGestureRecognizer:tg];
        index++;
    }
    
    CGFloat height = 0.0f;
    
    index = 0;
    for(UIView *view in self.arr)
    {
        view.center = CGPointMake(0.5*CGRectGetWidth(self.view.frame), (index+0.5)*CGRectGetHeight(view.frame) + 20);
        
        if(index == 3)
        {
            height = CGRectGetMaxY(view.frame);
        }
        
        index++;
    }
    
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), height);
    
    

    
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
-(IBAction)tapAction:(id)sender
{
    DetailViewController *dc = [[DetailViewController alloc] init];
    [self presentViewController:dc animated:YES completion:nil];
}

@end
