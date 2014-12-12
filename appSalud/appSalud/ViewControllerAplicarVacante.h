//
//  ViewControllerAplicarVacante.h
//  appSalud
//
//  Created by Christopher Hardy on 12/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewControllerAplicarVacante : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *editNombreVacante;
@property (weak, nonatomic) IBOutlet UITextField *editEdad;
@property (weak, nonatomic) IBOutlet UITextField *editGradoEstudios;
@property (weak, nonatomic) IBOutlet UITextField *editCarrera;
@property (weak, nonatomic) IBOutlet UITextField *editCorreo;
@property (weak, nonatomic) IBOutlet UITextField *editTelefono;
@property (weak, nonatomic) IBOutlet UITextField *editNombre;

@property (weak, nonatomic) IBOutlet UITableView *tablaGradoEstudios;
@property (weak, nonatomic) IBOutlet UIButton *botonHombre;
@property (weak, nonatomic) IBOutlet UIButton *botonMujer;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContenido;




@end
