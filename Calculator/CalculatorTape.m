//
//  CalculatorTape.m
//  Calculator
//
//  Created by Arkadiusz Dowejko on 25/02/2013.
//
//

#import "CalculatorTape.h"
#import "CalculatorViewController.h"

@interface CalculatorTape ()
@property (nonatomic, strong) CalculatorViewController *parent;
@end

@implementation CalculatorTape


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)clearTape {
    self.parent = [[CalculatorViewController alloc] init];
    self.parent.isTapeCleared=YES;   
    self.tapeStringDisplay = [NSMutableString stringWithString:@""];
    _mainText.text= @"";
    
    }

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	_mainText.text= _tapeStringDisplay;
    
     UIApplication *app = [UIApplication sharedApplication]; UIInterfaceOrientation currentOrientation = app.statusBarOrientation; [self doLayoutForOrientation:currentOrientation];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMainText:nil];
    [self setButtonBack:nil];
    [self setButtonClear:nil];
       [super viewDidUnload];
    
 }

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self doLayoutForOrientation:toInterfaceOrientation];
}

- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        
        
    } else {
        
        _buttonBack.frame=  CGRectMake(61,51, 82,36);
           _buttonClear.frame=  CGRectMake(61,420, 82,36);
        _mainText.frame=  CGRectMake(61,180, 280,161);
        
    } }


@end
