//
//  ViewController.m
//  Game24Point
//
//  Created by Kingiol on 13-4-26.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "ViewController.h"

#import "GameViewController.h"

@interface ViewController () <GameViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UIButton *startGameBtn;
@property (nonatomic, weak) IBOutlet UIImageView *icon2ImageView;
@property (nonatomic, weak) IBOutlet UIImageView *icon4ImageView;

@end

@implementation ViewController

@synthesize startGameBtn = _startGameBtn;
@synthesize icon2ImageView = _icon2ImageView;
@synthesize icon4ImageView = _icon4ImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.startGameBtn gameAddCustomButton];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.icon2ImageView.hidden = YES;
    self.icon4ImageView.hidden = YES;
    self.startGameBtn.alpha = 0.0f;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.icon2ImageView.hidden = NO;
    self.icon4ImageView.hidden = NO;
    
    CGPoint icon2Center = CGPointMake(-75.f, 75.f + 10.f);
    self.icon2ImageView.center = icon2Center;
    
    CGFloat width = self.view.bounds.size.width;
    
    CGPoint icon4Center = CGPointMake(width + 75.0f, icon2Center.y);
    self.icon4ImageView.center = icon4Center;
    
    icon2Center = self.icon2ImageView.center;
    icon2Center.x = width/2.0f - 75.0f;    
    
    icon4Center = self.icon4ImageView.center;
    icon4Center.x = width/2.0f + 75.0f;
    
    [UIView animateWithDuration:3.0f
                          delay:0.5f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         self.icon2ImageView.center = icon2Center;
                         self.icon4ImageView.center = icon4Center;
                         self.startGameBtn.alpha = 1.0f;
                     }
                     completion:^(BOOL finished) {

                     }];
    
}

- (IBAction)startGame:(UIButton *)sender {
    NSLog(@"start game");
    [self performStartGame];
}

- (void)performStartGame {
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.icon2ImageView.center.y;
    CGPoint centerPoint = CGPointMake(width/2.0f, height);
    
    [UIView animateWithDuration:0.5f
                          delay:0.2f
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.icon2ImageView.center = centerPoint;
                         self.icon4ImageView.center = centerPoint;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3f
                                               delay:0.0f
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              CGPoint disPoint = CGPointMake(width/2.0f, -75.0f);
                                              self.icon2ImageView.center = disPoint;
                                              self.icon4ImageView.center = disPoint;
                                          } completion:^(BOOL finished) {
                                              self.startGameBtn.alpha = 0.0f;
                                              [self performSegueWithIdentifier:@"startGameSegue" sender:self.startGameBtn];
                                          }];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *identifier =  segue.identifier;
    UIViewController *controller = segue.destinationViewController;
    
    if ([identifier isEqualToString:@"startGameSegue"]) {
        GameViewController *controller = (GameViewController *)controller;
        controller.delegate = self;
        [NSThread sleepForTimeInterval:10];
    }
}

@end
