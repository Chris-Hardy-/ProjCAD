//
//  ViewControllerVacantes.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 26/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerVacantes : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tablaVacantes;
@property (weak, nonatomic) IBOutlet UITextField *editBotonVacantes;

@property (weak, nonatomic) IBOutlet UITextField *editTitulo;
@property (weak, nonatomic) IBOutlet UITextField *editPerfil;
@property (weak, nonatomic) IBOutlet UILabel *labelFechaPeriodo;
@property (weak, nonatomic) IBOutlet UILabel *labelPeriodoLugar;
@property (weak, nonatomic) IBOutlet UITextField *editPeriodoLugar;
@property (weak, nonatomic) IBOutlet UILabel *labelHabilidadSueld;
@property (weak, nonatomic) IBOutlet UITextField *editHabilidadesSueldo;

@property (weak, nonatomic) IBOutlet UIButton *botonServSoc;
@property (weak, nonatomic) IBOutlet UIButton *botonOfertLab;

@property (weak, nonatomic) IBOutlet UIButton *botonAplicar;

@property (weak, nonatomic) IBOutlet UITextField *editPublicacionInicio;

@end
