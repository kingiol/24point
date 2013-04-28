//
//  CardTable.h
//  Game24Point
//
//  Created by Kingiol on 13-4-27.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface CardTable : NSObject

- (void)shuffle;
- (int)cardsRemaining;
- (Card *)shuffledTopCard;

@end
