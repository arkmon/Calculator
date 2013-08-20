//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Arkadiusz Dowejko on 05/02/2013.
//
//

#import <UIKit/UIKit.h>
#import "CalculatorTape.h"

@interface CalculatorViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *operatorDisplay;
@property (weak, nonatomic) IBOutlet UIButton *special;
@property (nonatomic,strong)NSMutableString *recordAllOperationsString;
@property (assign,nonatomic) BOOL isTapeCleared;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UIButton *buttonMultiplication;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonDivision;
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UIButton *buttonDecimal;
@property (weak, nonatomic) IBOutlet UIButton *buttonZero;
@property (weak, nonatomic) IBOutlet UIButton *buttonSquare;
@property (weak, nonatomic) IBOutlet UIButton *buttonMinus;
@property (weak, nonatomic) IBOutlet UIButton *buttonSquareRoot;
@property (weak, nonatomic) IBOutlet UIButton *buttonOnex;
@property (weak, nonatomic) IBOutlet UIButton *buttonChangeSign;
@property (weak, nonatomic) IBOutlet UIButton *buttonEqual;
@property (weak, nonatomic) IBOutlet UIButton *buttonPi;
@property (weak, nonatomic) IBOutlet UIButton *buttonSine;
@property (weak, nonatomic) IBOutlet UIButton *buttonCos;
@property (weak, nonatomic) IBOutlet UIButton *buttonTan;
@property (weak, nonatomic) IBOutlet UIButton *buttonLog10;
@property (weak, nonatomic) IBOutlet UIButton *buttonLn;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (weak, nonatomic) IBOutlet UIButton *buttonAC;
@property (weak, nonatomic) IBOutlet UIButton *buttonSecond;
@property (weak, nonatomic) IBOutlet UIButton *buttonTape;
@property (weak, nonatomic) IBOutlet UILabel *labelRad;
@property (weak, nonatomic) IBOutlet UISwitch *switchOnOff;



@end
