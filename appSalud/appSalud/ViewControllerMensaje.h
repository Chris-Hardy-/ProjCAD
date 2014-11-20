//
//  ViewControllerMensaje.h
//  appSalud
//
//  Created by Christopher Hardy on 9/6/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewControllerMensaje : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIImageView *imagenPerfil;
@property (weak, nonatomic) IBOutlet UILabel *nombrePersona;
@property (weak, nonatomic) IBOutlet UILabel *apellidoPersona;
@property (weak, nonatomic) IBOutlet UITextView *mensajeBienvenida;
@property (weak, nonatomic) IBOutlet MKMapView *mapaOficina;


@end
