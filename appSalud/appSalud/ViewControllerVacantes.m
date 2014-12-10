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
    vacante *tempVacante, *muestraVacante;
    NSString *auxString;
    vacanteServicio *tempVacanteServicio, *muestraVacanteServicio;
    NSArray *tableData;
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
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayVacantes"]; //Vacio un array temporal con lo traido de xml
    arrayVacantes = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    arrayData = [userDefaults objectForKey:@"arrayVacantesServicio"];
    arrayVacantesServicio = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    
    self.tablaVacantes.hidden = true;  //Se oculta la tabla al principio (es el box que guarda abajo del boton)
    
    self.tablaVacantes.delegate = self;
    self.tablaVacantes.dataSource = self;
    
    self.title = @"Vacantes";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];//despliega a menu principal
    
    self.tablaVacantes.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    self.botonOfertLab.selected = true;
    self.botonServSoc.selected = false;
    self. botonAplicar.hidden = true;
    tableData = arrayVacantes;
    
    
    //Cargado de datos inicial con OfertaLaboral
    
    
    
    
    
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
    self.tablaVacantes.hidden = false;
    tableData = arrayVacantes;
    self.botonAplicar.hidden = true;
//    [self.tablaVacantes reloadData];
}


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
    if (self.botonOfertLab.selected) {
        tempVacante = [tableData objectAtIndex:indexPath.row];
        cell.textLabel.text = tempVacante.bolsaTrabajo;
        return cell;
    }
    else if (self.botonServSoc.selected){
        tempVacanteServicio = [tableData objectAtIndex:indexPath.row];
        cell.textLabel.text = tempVacanteServicio.nombreServicioSocial;
        return cell;
    }
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.botonServSoc.selected) {
        muestraVacanteServicio = [arrayVacantesServicio objectAtIndex:indexPath.row];
        self.editTitulo.text = muestraVacanteServicio.nombreServicioSocial;
        self.editPerfil.text = muestraVacanteServicio.perfil;
        self.editPublicacionInicio.text = muestraVacanteServicio.periodoInicio;
        self.editPeriodoLugar.text = muestraVacanteServicio.periodoFin;
        self.editHabilidadesSueldo.text = muestraVacanteServicio.habilidades;
        self.botonAplicar.hidden = false;
    }
    else if (self.botonOfertLab.selected) {
        muestraVacante = [arrayVacantes objectAtIndex:indexPath.row];
        self.editTitulo.text = muestraVacante.bolsaTrabajo;
        self.editPerfil.text = muestraVacante.perfil;
        self.editPublicacionInicio.text = muestraVacante.fecPublicacion;
        self.editPeriodoLugar.text = muestraVacante.lugar;
        self.editHabilidadesSueldo.text = muestraVacante.sueldo;
        self.editEstado.text = muestraVacante.estado;
        self.botonAplicar.hidden = false;
    }
    
    self.tablaVacantes.hidden = true;
}


- (IBAction)botonServicioSocialClick:(id)sender {
    self.botonServSoc.selected = true;
    self.botonOfertLab.selected = false;
    self.labelFechaPeriodo.text = @"Periodo Inicio";
    self.labelPeriodoLugar.text = @"Periodo Fin";
    self.labelHabilidadSueld.text = @"Habilidades";
    self.labelEstado.hidden = true;
    self.editEstado.hidden = true;
    tableData=arrayVacantesServicio;
    [self.tablaVacantes reloadData];
    
    self.editTitulo.text = @"";
    self.editPerfil.text = @"";
    self.editPublicacionInicio.text = @"";
    self.editPeriodoLugar.text = @"";
    self.editHabilidadesSueldo.text = @"";
    self.editEstado.text = @"";
    
    self.botonAplicar.hidden = true;
}

- (IBAction)botonOfertaLaboralClick:(id)sender {
    self.botonServSoc.selected = false;
    self.botonOfertLab.selected = true;
    self.labelFechaPeriodo.text = @"Fecha Publicación";
    self.labelPeriodoLugar.text = @"Lugar";
    self.labelHabilidadSueld.text = @"Sueldo";
    self.labelEstado.hidden = false;
    self.editEstado.hidden = false;
    tableData = arrayVacantes;
    [self.tablaVacantes reloadData];
    
    self.editTitulo.text = @"";
    self.editPerfil.text = @"";
    self.editPublicacionInicio.text = @"";
    self.editPeriodoLugar.text = @"";
    self.editHabilidadesSueldo.text = @"";
    self.editEstado.text = @"";
    
    self.botonAplicar.hidden = true;
    
}
- (IBAction)botonOcultar:(id)sender {
    tableData = arrayVacantes;
    self.tablaVacantes.hidden = true;
    self.botonAplicar.hidden = false;

}
- (IBAction)botonAplicar:(id)sender {
}

@end
