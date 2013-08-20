//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Arkadiusz Dowejko on 05/02/2013.
//
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber;
@property (nonatomic, strong) CalculatorBrain *brain;


@end

@implementation CalculatorViewController

@synthesize display;
@synthesize brain;

- (CalculatorBrain *)brain
{
    if (!brain) {
        
        brain= [[CalculatorBrain alloc] init];
        self.brain.radian = YES;
        self.brain.secondFunction= NO;
    
    }
    return brain;

}



- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    if ([@"π" isEqual:digit]){
    
        digit=@"3.14159265";
        _userIsInTheMiddleOfEnteringNumber = NO;
        
    [_recordAllOperationsString appendString:digit];
        
    }
    
    
    else if ([@"0" isEqual:digit] && [@"0" isEqual:display.text]){
		_userIsInTheMiddleOfEnteringNumber = NO;
         [_recordAllOperationsString appendString:digit];
		return;
	}
    
    if (self.userIsInTheMiddleOfEnteringNumber){
        
        if (![@"." isEqual:digit] || ([@"." isEqual:digit] &&
        [display.text rangeOfString:@"."].location == NSNotFound)){
        
        
    self.display.text = [self.display.text stringByAppendingString:digit];
         [_recordAllOperationsString appendString:digit];
        }
    }
    else { 
        self.display.text = digit;
        [_recordAllOperationsString appendString:digit];
        self.userIsInTheMiddleOfEnteringNumber =YES;
    }
}

- (IBAction)specialFunction {
    self.brain.secondFunction =!self.brain.secondFunction;
   
    self.special.selected = !_special.selected;
    if (self.special.selected)
     [NSOperationQueue.mainQueue addOperationWithBlock:^{ self.special.highlighted = YES; }];
   else
       [NSOperationQueue.mainQueue addOperationWithBlock:^{ self.special.highlighted = NO; }];
       
   
   
    
}


- (IBAction)operationPressed:(id)sender {
    
     NSString *operation = [sender currentTitle];
    
    if (self.userIsInTheMiddleOfEnteringNumber || [@"=" isEqual:operation]){
        self.brain.operand = display.text.doubleValue;
		self.userIsInTheMiddleOfEnteringNumber = NO;
         
        [_recordAllOperationsString appendString:operation];
    }
        
    double result = [self.brain performOperation:operation];
  
    if ( isnan(result) || isinf(result) ) {
		display.text = @"Error";
         [_recordAllOperationsString appendString:@"Error \n"];
	}
    
    else {
		if ([@"=" isEqual:operation]){
			_operatorDisplay.text = @"";
            [_recordAllOperationsString appendString:[NSString stringWithFormat:@"%g", result]];
            [_recordAllOperationsString appendString:@"\n"];
		}
        else {
			_operatorDisplay.text = self.brain.OperationEntered;
		}
    
    self.display.text = [NSString stringWithFormat:@"%g", result];
    
      
    }
}

- (IBAction)radianOrDegreeSwitch {
    
    self.brain.radian =!self.brain.radian;
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 self.display.font = [UIFont fontWithName:@"DBLCDTempBlack" size:32];
       
[self setRecordAllOperationsString:[NSMutableString stringWithString:@""]];
    
    UIApplication *app = [UIApplication sharedApplication]; UIInterfaceOrientation currentOrientation = app.statusBarOrientation; [self doLayoutForOrientation:currentOrientation];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
   
    [self setOperatorDisplay:nil];
    [self setSpecial:nil];
    [self setButtonSeven:nil];
    [self setButtonEight:nil];
    [self setButtonNine:nil];
    [self setButtonMultiplication:nil];
    [self setButtonFour:nil];
    [self setButtonFive:nil];
    [self setButtonSix:nil];
    [self setButtonDivision:nil];
    [self setButtonOne:nil];
    [self setButtonTwo:nil];
    [self setButtonThree:nil];
    [self setButtonPlus:nil];
    [self setButtonDecimal:nil];
    [self setButtonZero:nil];
    [self setButtonSquare:nil];
    [self setButtonMinus:nil];
    [self setButtonSquareRoot:nil];
    [self setButtonOnex:nil];
    [self setButtonChangeSign:nil];
    [self setButtonEqual:nil];
    [self setButtonPi:nil];
    [self setButtonSine:nil];
    [self setButtonCos:nil];
    [self setButtonTan:nil];
    [self setButtonLog10:nil];
    [self setButtonLn:nil];
    [self setButtonC:nil];
    [self setButtonAC:nil];
    [self setButtonSecond:nil];
    [self setButtonTape:nil];
    [self setLabelRad:nil];
    [self setSwitchOnOff:nil];
    [super viewDidUnload];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CalculatorTape *destination =
    [segue destinationViewController];
    
    destination.tapeStringDisplay = _recordAllOperationsString;
    
}

-(IBAction)returned:(UIStoryboardSegue *)segue {
    
  if (_isTapeCleared){
      self.recordAllOperationsString = [NSMutableString stringWithString:@""];
      _isTapeCleared=NO;
   }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self doLayoutForOrientation:toInterfaceOrientation];
}

- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        
       
        
    } else {
        
        _buttonEight.frame=  CGRectMake(290,73, 55,30);
         _buttonSeven.frame=  CGRectMake(228,73, 55,30);
        _buttonNine.frame=  CGRectMake(354,73, 55,30);
        _buttonMultiplication.frame=  CGRectMake(416,73,55,30);
        _buttonFour.frame=  CGRectMake(228,110, 55,30);
        _buttonFive.frame=  CGRectMake(290,110, 55,30);
        _buttonSix.frame=  CGRectMake(354, 110, 55,30);
        _buttonDivision.frame=  CGRectMake(416, 110, 55,30);
        _buttonOne.frame=  CGRectMake(228,147, 55,30);
        _buttonTwo.frame=  CGRectMake(290, 147, 55,30);
        _buttonThree.frame=  CGRectMake(354, 147, 55,30);
        _buttonPlus.frame=  CGRectMake(416, 147, 55,30);
        _buttonDecimal.frame=  CGRectMake(228,184, 55,30);
        _buttonZero.frame=  CGRectMake(290, 184, 55,30);
        _buttonSquare.frame=  CGRectMake(354, 221, 55,30);
        _buttonMinus.frame=  CGRectMake(416, 184, 55,30);
        _buttonSquareRoot.frame=  CGRectMake(354, 258, 55,30);
        _buttonOnex.frame=  CGRectMake(290, 258, 55,30);
        _buttonChangeSign.frame=  CGRectMake(416, 258, 55,30);
        _buttonEqual.frame=  CGRectMake(416, 221, 55,30);
        _buttonPi.frame=  CGRectMake(354, 184, 55,30);
        _buttonSine.frame=  CGRectMake(290, 221, 55,30);
        _buttonCos.frame=  CGRectMake(228, 258, 55,30);
        _buttonTan.frame=  CGRectMake(228, 221, 55,30);
        _buttonLog10.frame=  CGRectMake(164, 147, 55,30);
        _buttonLn.frame=  CGRectMake(164, 184, 55,30);
        _buttonC.frame=  CGRectMake(164, 110, 55,30);
        _buttonAC.frame=  CGRectMake(164, 73, 55,30);
        _buttonSecond.frame=  CGRectMake(164, 221, 55,30);
        _buttonTape.frame=  CGRectMake(164, 258, 55,30);
        _labelRad.frame=  CGRectMake(60, 221, 55,30);
        _switchOnOff.frame=  CGRectMake(60, 254, 79,27);
       
       
    } }

@end
