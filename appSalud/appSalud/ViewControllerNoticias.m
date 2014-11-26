//
//  ViewControllerNoticias.m
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerNoticias.h"
#import "SWRevealViewController.h"
#import "noticia.h"
#import "indice_consejo.h"

@interface ViewControllerNoticias ()

@end

@implementation ViewControllerNoticias{
    NSArray *arrayIndices;
    NSUserDefaults *userDefaults;
    NSArray *arrayNoticias;
    noticia *tempNoticia;
    indice_consejo *tempIndicador;
    NSString *auxString;
    
    
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
    // initialize table data Dulce =)
    
    
    //Cambio de font
    self.buttonNutricional.titleLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
    self.buttonEstacionales.titleLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
    self.titleConsejos.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
    self.editBoton.font = [UIFont fontWithName:@"Antipasto" size:18.0f];

    
    tableData = [[NSArray alloc] init];
    
    arrayIndices = [[NSArray alloc] init];
    arrayNoticias = [[NSArray alloc] init];
    
    tempIndicador = [[indice_consejo alloc] init];
    tempNoticia = [[noticia alloc] init];
    
    
    self.TablaNoticias.delegate = self;
    
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayNoticias"];
    arrayNoticias = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    arrayData = [userDefaults objectForKey:@"arrayIndicadores"];
    arrayIndices = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    tableData = arrayNoticias;
    
    self.TablaIndices.hidden = true; //Se oculta la tabla al principio (es el box que guarda abajo del boton)
    
    self.title=@"Noticias";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    self.TablaIndices.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    self.TablaNoticias.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    self.editBoton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
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

- (IBAction)mostrarTablaIndices:(id)sender {
    NSLog(@"Ñ");
    self.TablaIndices.hidden = false;
    tableData = arrayIndices;
    [self.TablaIndices reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.TablaNoticias) {
        tableData = arrayNoticias;
        return  [arrayNoticias count];
    }
    else if (tableView == self.TablaIndices){
        tableData = arrayIndices;
        return  [arrayIndices count];
    }
    
    return 0;
    
    //Funcion para ocultar la tableviewIndices dando click en la pantalla
}
- (IBAction)ocultarTablaIndices:(id)sender {
    tableData = arrayNoticias;
    self.TablaIndices.hidden = true;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (tableView == self.TablaIndices) {
        static NSString *NoticiasIdentifier = @"celdaIndicadores";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NoticiasIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] init];
        }
        tempIndicador = [arrayIndices objectAtIndex:indexPath.row];
        cell.textLabel.text = tempIndicador.titulo;
        cell.detailTextLabel.text = tempIndicador.texto;
        cell.textLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f]; //change font
        cell.detailTextLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
        return cell;
    }
    else if (tableView == self.TablaNoticias) {
        static NSString *NoticiasIdentifier = @"celdaNoticia";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NoticiasIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NoticiasIdentifier];
            
        }
        tempNoticia = [arrayNoticias objectAtIndex:indexPath.row];
        
        cell.textLabel.text = tempNoticia.tituloNoticia;
        
        cell.textLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
        
        return cell;
        
        
    }
    
    UITableViewCell *cell;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.TablaNoticias) {
        NSString *aux;
        aux = [NSString stringWithFormat:@"%li",(long)indexPath.row];
        [userDefaults setObject:aux forKey:@"indiceMuestraNoticia"];
    }
}


- (IBAction)mostrarNutricionales:(id)sender {
    [userDefaults setObject:@"nutricionales" forKey:@"muestraConsejo"];
}

- (IBAction)mostrarEstacionales:(id)sender {
    [userDefaults setObject:@"estacionales" forKey:@"muestraConsejo"];
}

@end