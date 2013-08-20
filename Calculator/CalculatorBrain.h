//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Arkadiusz Dowejko on 05/02/2013.
//
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject


@property (nonatomic)double operand,operand2;
@property (nonatomic,weak)NSString *OperationEntered;
@property BOOL waitingForOperation;
@property BOOL waitingForOperand;
@property (nonatomic) BOOL radian;
@property (nonatomic) BOOL secondFunction;


- (double) performOperation: (NSString *) operation;



@end
