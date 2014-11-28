//
//  ViewControllerVacantes.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 26/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerVacantes.h"
#import "SWRevealViewController.h"

@interface ViewControllerVacantes ()

@end

@implementation ViewControllerVacantes{
    NSArray *arrayVacantes;
    NSUserDefaults *userDefaults;
    
    
}

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
    
     tableData = [[NSArray alloc] init];
    arrayVacantes = [[NSArray alloc] init];
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayVacantes"];
    arrayVacantes = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    self.TablaVacantes.hidden = true;  //Se oculta la tabla al principio (es el box que guarda abajo del boton)
    
    self.title = @"Vacantes";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];//despliega a menu principal
    

    
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
- (IBAction)mostrarTablaVacantes:(id)sender {
    NSLog(@"Ñ");
    self.TablaVacantes.hidden = false;
    tableData = arrayVacantes;
    [self.TablaVacantes reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.TablaVacantes){
        tableData = arrayVacantes;
        return  [arrayVacantes count];
    }
    
    return 0;
    
    //Funcion para ocultar la tableviewVacantes dando click en la pantalla
}

- (IBAction)ocultarTablaVacantes:(id)sender {
    tableData = arrayVacantes;
    self.TablaVacantes.hidden = true;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
        static NSString *VacantesIdentifier = @"celdaVacantes";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VacantesIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] init];
        }
        return cell;
}

@end
