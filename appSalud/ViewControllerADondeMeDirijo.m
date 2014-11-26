//
//  ViewControllerADondeMeDirijo.m
//  appSalud
//
//  Created by Christopher Hardy on 11/26/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerADondeMeDirijo.h"
#import "SWRevealViewController.h"

@interface ViewControllerADondeMeDirijo (){
    bool nacido, nino, adulto, hemorragia, trasladar;
    float temp;
}

@end

@implementation ViewControllerADondeMeDirijo

@synthesize botonAdulto, botonNacido, botonNino, switchHemorragia, switchTrasladar, pickerTemperatura;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"¿A dónde me dirjo?";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)botonReciendNacido:(id)sender {
}

- (IBAction)botonNino:(id)sender {
}

- (IBAction)botonAdulto:(id)sender {
}
- (IBAction)botonEvaluar:(id)sender {
}

@end
