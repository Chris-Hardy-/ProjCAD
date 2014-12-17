//
//  ViewControllerAplicarVacante.m
//  appSalud
//
//  Created by Christopher Hardy on 12/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerAplicarVacante.h"
#import "SWRevealViewController.h"
#import "vacante.h"
#import "vacanteServicio.h"

@interface ViewControllerAplicarVacante (){
    NSArray *tableData;
    NSString *nombrePuesto;
    NSUserDefaults *userDefaults;
    vacante *tempVacante;
    vacanteServicio *tempVacanteSS;
    NSString *genero;
}

@end

@implementation ViewControllerAplicarVacante
@synthesize editCarrera, editEdad, editCorreo, editGradoEstudios, editNombreVacante, editTelefono, tablaGradoEstudios;

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
    
    //Setup de navegacion
    //    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    //    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
    //                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    //    self.navigationItem.leftBarButtonItem = flipButton;
    self.title = @"Aplicar para Vacante";
    //    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];//despliega a menu principal
    
    //Setup de Tabla
    tableData = [NSArray arrayWithObjects: @"Preparatoria",@"Bachillerato",@"Licenciatura",@"Ingenieria",@"Maestria",@"Doctorado",nil];
    self.tablaGradoEstudios.delegate = self;
    self.tablaGradoEstudios.dataSource = self;
    self.tablaGradoEstudios.hidden=true;
    
    //Setup Textfield delegates
    self.editCarrera.delegate = self;
    self.editEdad.delegate = self;
    self.editCorreo.delegate = self;
    self.editGradoEstudios.delegate = self;
    self.editNombreVacante.delegate = self;
    self.editTelefono.delegate = self;
    self.tablaGradoEstudios.delegate = self;
    self.editNombre.delegate = self;
    
    NSData *tempData;
    
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    tempVacante = [[vacante alloc] init];
    tempVacanteSS = [[vacanteServicio alloc] init];
    
    
    if ([@"SS" isEqualToString:[NSString stringWithFormat:@"%@", [userDefaults objectForKey:@"tipoVacante"]]]) {
        tempData = [userDefaults objectForKey:@"VacanteAplicacion"];
        tempVacanteSS = [NSKeyedUnarchiver unarchiveObjectWithData:tempData];
        nombrePuesto = tempVacanteSS.nombreServicioSocial;
    }
    else if ([@"VL" isEqualToString:[NSString stringWithFormat:@"%@", [userDefaults objectForKey:@"tipoVacante"]]]) {
        tempData = [userDefaults objectForKey:@"VacanteAplicacion"];
        tempVacante = [NSKeyedUnarchiver unarchiveObjectWithData:tempData];
        nombrePuesto = tempVacante.nombreBolsaTrabajo;
    }
    
    self.editNombreVacante.text = nombrePuesto;
    
    
    self.scrollViewContenido.scrollEnabled = true;
    self.scrollViewContenido.contentSize = self.scrollViewContenido.frame.size;
    self.scrollViewContenido.frame = self.view.frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    self.scrollViewContenido.contentSize = CGSizeMake([UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height+100);
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

#pragma mark - Tabla

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
    
    //Funcion para ocultar la tableviewVacantes dando click en la pantalla
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    static NSString *VacantesIdentifier = @"celdaVacantes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VacantesIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.editGradoEstudios.text = [tableData objectAtIndex:indexPath.row];
    self.tablaGradoEstudios.hidden = true;
}
- (IBAction)botonDespleglarTabla:(id)sender {
    self.tablaGradoEstudios.hidden = false;
    [self.editTelefono resignFirstResponder];
    [self.editCarrera resignFirstResponder];
    [self.editEdad resignFirstResponder];
    [self.editCorreo resignFirstResponder];
    [self.editNombre resignFirstResponder];
    
}
- (IBAction)botonEscondeTabla:(id)sender {
    self.tablaGradoEstudios.hidden = true;
    [self.editTelefono resignFirstResponder];
    [self.editCarrera resignFirstResponder];
    [self.editEdad resignFirstResponder];
    [self.editCorreo resignFirstResponder];
    [self.editNombre resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (IBAction)butonHombre:(id)sender {
    self.botonHombre.selected = true;
    self.botonMujer.selected = false;
    genero=@"M";
}
- (IBAction)butonMujer:(id)sender {
    self.botonHombre.selected = false;
    self.botonMujer.selected = true;
    genero=@"F";
}

- (IBAction)botonEnviarDatos:(id)sender {
    
    
    
    if ([self.editNombre.text isEqualToString:@""] || self.botonMujer.selected == false || self.botonHombre.selected == false || [self.editEdad.text isEqualToString:@""] || [self.editGradoEstudios.text isEqualToString:@""] || [self.editCarrera.text isEqualToString:@""] || [self.editTelefono.text isEqualToString:@""] || [self.editCorreo.text isEqualToString:@""]) {
    
        NSString *myRequestString;
        
        if ([@"SS" isEqualToString:[NSString stringWithFormat:@"%@", [userDefaults objectForKey:@"tipoVacante"]]]) {
            myRequestString = [[NSString alloc] initWithFormat:@"http://192.168.1.159:8888/ConfigAppiOS/procesaVacante.php?nombre=%@&tel=%@&correo=%@&carrera=%@&genero=%@&edad=%@&ultimogradoe=%@&ssobt=%@&idssobt=%i",self.editNombre.text, self.editTelefono.text, self.editCorreo.text, self.editCarrera.text, genero, self.editEdad.text, self.editGradoEstudios.text, @"SS",[tempVacanteSS.idVacanteServicio intValue]];
        }
        else if ([@"VL" isEqualToString:[NSString stringWithFormat:@"%@", [userDefaults objectForKey:@"tipoVacante"]]]) {
            myRequestString = [[NSString alloc] initWithFormat:@"http://192.168.1.159:8888/ConfigAppiOS/procesaVacante.php?nombre=%@&tel=%@&correo=%@&carrera=%@&genero=%@&edad=%@&ultimogradoe=%@&ssobt=%@&idssobt=%i",self.editNombre.text, self.editTelefono.text, self.editCorreo.text, self.editCarrera.text, genero, self.editEdad.text, self.editGradoEstudios.text, @"BT",[tempVacante.idBolsaTrabajo intValue]];
        }
        
       myRequestString=[myRequestString
                                  stringByReplacingOccurrencesOfString:@" " withString:@""];
    
        NSURL *url = [[NSURL alloc] init];
        url = [NSURL URLWithString:myRequestString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            if (!error) {
                NSLog(@"GET REALIZADO");
                UIAlertView *message;
                message = [[UIAlertView alloc] initWithTitle:@"Exito"
                                                     message:@"Los datos fueron envidos correctamente"
                                                    delegate:self
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles:nil];
                [message show];            }
            else
                NSLog(@"%@", error);
        }];
        
    }
    
    else {
        UIAlertView *message;
        message = [[UIAlertView alloc] initWithTitle:@"Error"
                                             message:@"Alguno de los campos no esta llenado"
                                            delegate:self
                                   cancelButtonTitle:@"Ok"
                                   otherButtonTitles:nil];
        [message show];
        
    }
}

- (IBAction)reposicionarTelefono:(id)sender {
    self.scrollViewContenido.contentOffset = CGPointMake(0,50);
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if ([alertView.title isEqualToString:@"Exito"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}




@end
