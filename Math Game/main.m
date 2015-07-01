//
//  main.m
//  Math Game
//
//  Created by Cody Zazulak on 2015-06-30.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>

int player1Lives = 3;
int player2Lives = 3;
int currentPlayer = 1;
int playerAnswer;

bool checkLives() {
    if ((player1Lives > 0) && (player2Lives > 0)) {
        return true;
    } else {
        return false;
    }
}
int get_answer(x, y) {
    printf("Player %d: What does %d + %d equal?\n", currentPlayer,x,y);
    scanf("%d", &playerAnswer);
    return playerAnswer;
}

int switch_player() {
    if (currentPlayer == 1) {
        currentPlayer = 2;
        printf("You have %d lives remaining\n", player1Lives);
        return currentPlayer;
    } else {
        currentPlayer = 1;
        printf("You have %d lives remaining\n", player2Lives);
        return currentPlayer;
    }
}

int calculate_answer(x, y) {
    return x + y;
}

void check_answer(answer, right_answer) {
    if (answer == right_answer) {
        printf("Correct!\n");
    } else {
        if (currentPlayer == 1) {
            player1Lives -= 1;
            printf("Wrong! %d lives left!\n", player1Lives);
        } else {
            player2Lives -= 1;
            printf("Wrong! %d lives left!\n", player2Lives);
        }
    }
}

int main(int argc, const char * argv[]) {
    
    while (checkLives()) {
        
        int x  = rand() % 21;
        int y  = rand() % 21;
        
        int right_answer = calculate_answer(x, y);
        int answer = get_answer(x, y);
        
        check_answer(answer, right_answer);
        switch_player();
        
    }
    
    if (player1Lives == 0) {
        printf("Player 2 wins!");
    } else {
        printf("Player 1 wins!");
    }
    
    // sorry no restart yet
    
    return 0;
}
