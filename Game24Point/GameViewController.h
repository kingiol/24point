//
//  GameViewController.h
//  Game24Point
//
//  Created by Kingiol on 13-4-28.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameViewController;

@protocol GameViewControllerDelegate <NSObject>



@end

@interface GameViewController : UIViewController

@property (nonatomic, weak) id<GameViewControllerDelegate> delegate;

@end
