//
//  ViewControllerVacantes.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 26/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerVacantes.h"
#import "SWRevealViewController.h"
#import "vacante.h"
#import "vacanteServicio.h"

@interface ViewControllerVacantes ()

@end

@implementation ViewControllerVacantes{
    NSArray *arrayVacantes;
    NSArray *arrayVacantesServicio;
    NSUserDefaults *userDefaults;
    vacante *tempVacante;
    NSString *auxString;
    vacanteServicio *tempVacanteServicio;
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
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    tableData = [[NSArray alloc] init];
    arrayVacantes = [[NSArray alloc] init];
    arrayVacantesServicio = [[NSArray alloc] init];
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayVacantes"];
    arrayVacantes = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    self.TablaVacantes.hidden = true;  //Se oculta la tabla al principio (es el box que guarda abajo del boton)
    
    self.title = @"Vacantes";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];//despliega a menu principal
    
    self.TablaVacantes.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    self.botonOfertLab.selected = true;
    self.botonServSoc.selected = false;
    
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
    self.botonAplicar.hidden = true;
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
        static NSString *VacantesIdentifier = @"celdaVacantes";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VacantesIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] init];
        }
        return cell;
}

- (IBAction)botonServicioSocialClick:(id)sender {
    self.botonServSoc.selected = true;
    self.botonOfertLab.selected = false;
    self.editTitulo.text = @"EL TEXTO DEL XML";
    self.editPerfil.text = @"EL TEXTO DEL XML";
    self.labelFechaPeriodo.text = @"Periodo Inicio";
    self.labelPeriodoLugar.text = @"Periodo Fin";
    self.labelHabilidadSueld.text = @"Habilidades";
    self.labelEstado.hidden = true;
    self.editEstado.hidden = true;
    
}

- (IBAction)botonOfertaLaboralClick:(id)sender {
    self.botonServSoc.selected = false;
    self.botonOfertLab.selected = true;
    self.editTitulo.text = @"EL TEXTO DEL XML";
    self.editPerfil.text = @"EL TEXTO DEL XML";
    self.labelFechaPeriodo.text = @"Fecha Publicación";
    self.labelPeriodoLugar.text = @"Lugar";
    self.labelHabilidadSueld.text = @"Sueldo";
    self.labelEstado.hidden = false;
    self.editEstado.hidden = false;
    
    
}
- (IBAction)botonOcultar:(id)sender {
    tableData = arrayVacantes;
    self.TablaVacantes.hidden = true;
    self.botonAplicar.hidden = false;

}
- (IBAction)botonAplicar:(id)sender {
}

@end
