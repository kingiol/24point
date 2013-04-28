//
//  CardTable.m
//  Game24Point
//
//  Created by Kingiol on 13-4-27.
//  Copyright (c) 2013年 Kingiol. All rights reserved.
//

#import "CardTable.h"

#import "Card.h"

#define CARDTABLE_COUNT 52

@implementation CardTable {
    NSMutableArray *_cards;
}

- (id)init {
    if ((self = [super init])) {
        _cards = [NSMutableArray arrayWithCapacity:CARDTABLE_COUNT];
        [self initCards];
    }
    return self;
}

- (void)shuffle {
    
    NSUInteger count = [_cards count];
    NSMutableArray *shuffled = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        int r = RANDOM_INT([self cardsRemaining]);
        Card *card = [_cards objectAtIndex:r];
        [shuffled addObject:card];
        [_cards removeObject:card];
    }
    
    _cards = shuffled;
}

- (int)cardsRemaining {
    return [_cards count];
}

- (Card *)shuffledTopCard {
    NSAssert([self cardsRemaining] > 0, @"No more card in the card table.");
    Card *card = [_cards lastObject];
    [_cards removeLastObject];
    return card;
}

- (void)initCards {
    for (CardSuit suit = CardSuitClubs; suit <= CardSuitSpades; suit++) {
        for (int value = CardAce; value <= CardKing; value++) {
            Card *card = [[Card alloc] initWithCardSuit:suit value:value];
            [_cards addObject:card];
        }
    }
}

@end
