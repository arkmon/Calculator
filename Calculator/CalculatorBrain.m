//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Arkadiusz Dowejko on 05/02/2013.
//
//

#import "CalculatorBrain.h"
#import "CalculatorViewController.h"

@interface CalculatorBrain()
@end

@implementation CalculatorBrain




- (void)performTwoOperandOperation {  //two operand operations e.g. +,-,*,/
	if ([@"+" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
		_operand = _operand2 + _operand;
	} else if ([@"*" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
		_operand = _operand2 * _operand;
	} else if ([@"-" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
					_operand = _operand2 - _operand;
		
	} else if ([@"/" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
					_operand = _operand2 / _operand;
		
	}
    else {
		_waitingForOperand = YES;
	}
}



- (double) performOperation:(NSString *)operation

{
    
    if ([@"+/-" isEqualToString:operation]) {
        _OperationEntered = @"";
		if (_operand != 0) {
			_operand = -_operand;
		}
	}
        
   else  if ([operation isEqualToString:@"√x"]) {
		_operand = sqrt(_operand);
	}
    
    else if ([operation isEqualToString:@"π"]) {
        _OperationEntered = @"";

		_operand = M_PI;  //3.14159265;
	}
	
	else if ([@"x²" isEqualToString:operation]) {
		_operand = pow(_operand , 2);
	}
	
    else if ([@"sine" isEqualToString:operation]) {
         _OperationEntered = @"";
		if (_radian){
             if (self.secondFunction){
                  _operand = asin(_operand);
                 
             }
             else{
                 _operand = sin(_operand);
             }
		}else {//Degree
            
            if (self.secondFunction){
                _operand = (sin(_operand) * 180)/ M_PI ;
                
            }
            else {
			_operand = sin(_operand * M_PI / 180);
            }
        }
	}
	else if ([@"cos" isEqualToString:operation]) {
        _OperationEntered = @"";
        
        if (_radian){
            if (self.secondFunction){
                _operand = acos(_operand);
        }
            else  {_operand = cos(_operand);}
			
		}
        else  {//Degree
            if (self.secondFunction){
                _operand = (acos(_operand )* 180 )/ M_PI ;
            }
   
            else{
			_operand = cos(_operand * M_PI / 180);
            }
            
		}
	}
	else if ([@"tan" isEqualToString:operation]) {
         _OperationEntered = @"";
        
		if (_radian){
            if (self.secondFunction){
            _operand = atan(_operand);
            }
            else{
			_operand = tan(_operand);
            }
		}else {//Degree
            if (self.secondFunction){
                
                _operand = (atan(_operand) * 180 )/ M_PI;
            }
            
            else{
			_operand = tan(_operand * M_PI / 180);
            }
        }
	}
        
	else if ([@"1/x" isEqualToString:operation]) {
		_operand = 1/_operand;
	}
    
   
    
    else if ([@"ln" isEqualToString:operation]) {
        _operand = log(_operand);  
    }
    
    else if ([@"log₁₀" isEqualToString:operation]) {
        _operand = log10(_operand);  
    }
	
	//clear
	else if ([@"C" isEqual:operation]){
        _operand = 0;
		_OperationEntered = @"";
		_operand2 = 0;
        
        		        
	}
    
    else if ([@"AC" isEqual:operation]){
		_operand = 0;
		_OperationEntered = @"";
		_operand2 = 0;
       
	}
	
	else if ([@"=" isEqual:operation]){
		double originalOperand = _operand;
		[self performTwoOperandOperation];
		if (!_waitingForOperand){
			_operand2 = originalOperand;
			_waitingForOperand = YES;
		}
	}
	
		else {

		_operand2 = _operand;
		_OperationEntered = operation;
	}
	
	return _operand;


    
}


@end
