//
//  Card.h
//  Game24Point
//
//  Created by Kingiol on 13-4-27.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CardSuitClubs,  //梅花
    CardSuitDiamonds,   //方片
    CardSuitHearts, //红心
    CardSuitSpades  //黑桃
}CardSuit;

#define CardAce     1
#define CardJack    11
#define CardQueen   12
#define CardKing    13

@interface Card : NSObject

@property (nonatomic, assign, readonly) CardSuit cardSuit;
@property (nonatomic, assign, readonly) int value;
@property (nonatomic, assign) BOOL isTurnedFront;

- (id)initWithCardSuit:(CardSuit)cardSuit value:(int)value;
- (BOOL)isSameToCard:(Card *)otherCard;
- (BOOL)isEqualValueToCard:(Card *)otherCard;

@end
