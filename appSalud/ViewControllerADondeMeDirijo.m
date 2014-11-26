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
    NSArray *_pickerData;
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
    
    _pickerData = @[@"37",@"37.5",@"37.7",@"38",@"38.2",@"38.4",@"38.6",@"38.8",@"39",@"39.2",@"39.4",@"39.6",@"39.8",@"40"];
    [self.pickerTemperatura selectRow:4 inComponent:0 animated:YES];
    [self.pickerTemperatura reloadAllComponents];
    
    self.pickerTemperatura.delegate = self;
    pickerTemperatura.dataSource = self;
    
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
    [self.botonNacido setSelected:true];
    [self.botonAdulto setSelected:false];
    [self.botonNino setSelected:false];
    nacido = true;
}

- (IBAction)botonNino:(id)sender {
    [self.botonNacido setSelected:false];
    [self.botonAdulto setSelected:false];
    [self.botonNino setSelected:true];
    nino = true;
}

- (IBAction)botonAdulto:(id)sender {
    [self.botonNacido setSelected:false];
    [self.botonAdulto setSelected:true];
    [self.botonNino setSelected:false];
    adulto = true;
}
- (IBAction)botonEvaluar:(id)sender {
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    temp = [[_pickerData objectAtIndex:row] floatValue];
}

@end
