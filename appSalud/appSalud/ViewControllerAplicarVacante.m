//
//  ViewControllerAplicarVacante.m
//  appSalud
//
//  Created by Christopher Hardy on 12/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerAplicarVacante.h"
#import "SWRevealViewController.h"

@interface ViewControllerAplicarVacante (){
    NSArray *tableData;
    NSString *nombrePuesto;
    NSUserDefaults *userDefaults;
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
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    self.title = @"Aplicar para Vacante";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];//despliega a menu principal
    
    //Setup de Tabla
    tableData = [NSArray arrayWithObjects: @"Preparatoria",@"Bachillerato",@"Licenciatura",@"Ingeniería",@"Maestría",@"Doctorado",nil];
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
    
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    nombrePuesto = [NSString stringWithFormat:@"%@", [userDefaults objectForKey:@"nombreVacanteAplicacion"]];
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
}
- (IBAction)butonMujer:(id)sender {
    self.botonHombre.selected = false;
    self.botonMujer.selected = true;
}

- (IBAction)botonEnviarDatos:(id)sender {
    if ([self.editNombre.text isEqualToString:@""] || self.botonMujer.selected == false || self.botonHombre.selected == false || [self.editEdad.text isEqualToString:@""] || [self.editGradoEstudios.text isEqualToString:@""] || [self.editCarrera.text isEqualToString:@""] || [self.editTelefono.text isEqualToString:@""] || [self.editCorreo.text isEqualToString:@""]) {
        NSString *emailTitle = [NSString stringWithFormat:@"Aplicacion para el puesto de %@", nombrePuesto];
        NSString *messageBody = [NSString stringWithFormat:@"Nombre: %@ \n\nEdad: %@\n\nUltimo Grado de Estudio: %@ \n\nCarrera: %@\n\nCorreo de Contacto: %@\n\nTelefono de Contacto: %@", self.editNombre.text, self.editEdad.text, self.editGradoEstudios.text, self.editCarrera.text, self.editCorreo.text, self.editTelefono.text];
        NSArray *toRecipents = [NSArray arrayWithObject:@"hardy.chris.91@icloud.com"];
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
    }
    else
    {
        UIAlertView *message;
        message = [[UIAlertView alloc] initWithTitle:@"Error"
                                             message:@"Debes de llenar todos los campos"
                                            delegate:self
                                   cancelButtonTitle:@"Ok"
                                   otherButtonTitles:nil];
        [message show];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:{
            NSLog(@"Mail sent");
            UIAlertView *message;
            message = [[UIAlertView alloc] initWithTitle:@"Exito"
                                                 message:@"El Correo se ha enviado exitosamente"
                                                delegate:self
                                       cancelButtonTitle:@"Ok"
                                       otherButtonTitles:nil];
            [message show];
            break;}
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)reposicionarTelefono:(id)sender {
    self.scrollViewContenido.contentOffset = CGPointMake(0,50);
}


@end
