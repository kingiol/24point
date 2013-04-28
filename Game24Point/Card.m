//
//  Card.m
//  Game24Point
//
//  Created by Kingiol on 13-4-27.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize cardSuit = _cardSuit;
@synthesize value = _value;
@synthesize isTurnedFront = _isTurnedFront;

- (id)initWithCardSuit:(CardSuit)cardSuit value:(int)value {
    
    NSAssert(value >= CardAce && value <= CardKing, @"Invalid card value");
    
    if ((self = [super init])) {
        _cardSuit = cardSuit;
        _value = value;
    }
    return self;
}

- (BOOL)isSameToCard:(Card *)otherCard {
    
    NSParameterAssert(otherCard != nil);
    
    return (self.cardSuit == otherCard.cardSuit && self.value == otherCard.value);
    
}

- (BOOL)isEqualValueToCard:(Card *)otherCard {
    
    NSParameterAssert(otherCard != nil);
    
    return (self.value == otherCard.value);
    
}

@end
