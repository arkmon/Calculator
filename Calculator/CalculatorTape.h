//
//  CalculatorTape.h
//  Calculator
//
//  Created by Arkadiusz Dowejko on 25/02/2013.
//
//

#import <UIKit/UIKit.h>

@class CalculatorViewController;

@interface CalculatorTape : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *mainText;
@property (nonatomic, retain) NSMutableString *tapeStringDisplay;
@property (weak, nonatomic) IBOutlet UIButton *buttonBack;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;



@end
