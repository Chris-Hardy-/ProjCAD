//
//  ViewControllerConsejos.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 11/09/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerConsejos.h"
#import "indice_consejo.h"

@interface ViewControllerConsejos (){
    NSUserDefaults *userDefaults;
    indice_consejo *auxConsejo;
    NSArray *arrayNutricionales;
    NSArray *arrayEstacionales;
}




@end

@implementation ViewControllerConsejos

@synthesize arrayConsejos=_arrayConsejos;
@synthesize myPicker=_myPicker;
@synthesize myLabel=_myLabel;
@synthesize textFieldCuerpo=_textFieldCuerpo;



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
    
    //Llenado del pick view
    
    //Change font
    
    [self.textFieldCuerpo setFont:[UIFont fontWithName:@"Antipasto" size:18.0]];
    [self.myLabel setFont:[UIFont fontWithName:@"Antipasto" size:18.0]];
    
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    auxConsejo = [[indice_consejo alloc] init];
    
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayConsejosNutricionales"];
    arrayNutricionales = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    arrayData = [userDefaults objectForKey:@"arrayConsejosEstacionales"];
    arrayEstacionales = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    
    
    
    //NSArray *arrayNutricionales= [[NSArray alloc] initWithObjects:@"Indica1",@"Indica2",@"Indica3", nil];
   // NSArray *arrayEstacionales = [[NSArray alloc] initWithObjects:@"Esta1", @"Estacional2", @"Estacional3", nil];
    
    
    self.myPicker.delegate = self;
    
    self.myLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    
    
   // userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([[userDefaults objectForKey:@"muestraConsejo"] isEqualToString:@"Estacionales"]) {
        
        self.arrayConsejos=arrayEstacionales;
        self.title = @"Consejos Estacionales";
    }
    
    else if ([[userDefaults objectForKey:@"muestraConsejo"] isEqualToString:@"Nutricionales"])
    {
        self.arrayConsejos = arrayNutricionales;
        self.title = @"Consejos Nutricionales";
    }
    
    auxConsejo=[self.arrayConsejos objectAtIndex:0];
    self.myLabel.text = auxConsejo.titulo;
    self.textFieldCuerpo.text = auxConsejo.texto;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    self.textFieldCuerpo.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
}


//Cambio de font myPicker

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont: [UIFont fontWithName:@"Antipasto" size:18.0]];
        //[tView setTextAlignment:UITextAlignmentLeft];
    }
    // Fill the label text here
    auxConsejo = [self.arrayConsejos objectAtIndex:row];
    tView.textAlignment = NSTextAlignmentCenter;
    tView.text=auxConsejo.titulo;
    return tView;
}


//pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.arrayConsejos count];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    auxConsejo=[self.arrayConsejos objectAtIndex:row];
    self.textFieldCuerpo.text = auxConsejo.texto;
    self.myLabel.text = auxConsejo.titulo;
}

//Pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    auxConsejo=[self.arrayConsejos objectAtIndex:row];
    self.myLabel.text = auxConsejo.titulo;
    self.textFieldCuerpo.text = auxConsejo.texto;
    return auxConsejo.titulo;
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



@end
