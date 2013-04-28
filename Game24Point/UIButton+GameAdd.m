//
//  UIButton+GameAdd.m
//  Game24Point
//
//  Created by Kingiol on 13-4-28.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "UIButton+GameAdd.h"

@implementation UIButton (GameAdd)

- (void)gameAddCustomButton {
    
    self.titleLabel.font = [UIFont gameAddFontForSize:20.f];
    
    UIImage *normalImage = [[UIImage imageNamed:@"Button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 15.f, 0.f, 15.f)];
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage *lightedImage = [[UIImage imageNamed:@"ButtonPressed.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.f, 15.f, 0.f, 15.f)];
    [self setBackgroundImage:lightedImage forState:UIControlStateHighlighted];
    
}

@end
