//
//  CoordinationViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/11/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "CoordinationViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "VideoViewController.h"
#import "AWSDynamoDBHelper.h"

@interface CoordinationViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CoordinationViewController

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Strengthening.coordination", nil) uppercaseString];
    
    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(0, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *a3Button = [[HomeButton alloc] initWithText: NSLocalizedString(@"Coordination.legControl1", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [a3Button addRoundImageCentered:[UIImage imageNamed:COORDINATION_3A]];
    [a3Button addTarget:self action:@selector(a3Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *b3Button = [[HomeButton alloc] initWithText: NSLocalizedString(@"Coordination.legControl2", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [b3Button addRoundImageCentered:[UIImage imageNamed:COORDINATION_3B]];
    [b3Button addTarget:self action:@selector(b3Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview: a3Button];
    [self.contentView addSubview: b3Button];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}


- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Back Button", @"NA"]];
}

- (void)a3Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title =  COORDINATION_TITLE_3A_LEG_CONTROL_1;
    [videoVC setUpVideo: VIDEO_3A_LEG_CONTROL_1];
    [self.navigationController pushViewController:videoVC animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Start",@"3A_Leg_Control1", @"Video"]];
}

- (void)b3Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = COORDINATION_TITLE_3B_LEG_CONTROL_2;
    [videoVC setUpVideo: VIDEO_3B_LEG_CONTROL_2];
    [self.navigationController pushViewController:videoVC animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Start",@"3B_Leg_Control2", @"Video"]];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
