//
//  MainViewController.h
//  appSalud
//
//  Created by Christopher Hardy on 8/19/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MainViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIButton *botonMensajePersona1;
@property (weak, nonatomic) IBOutlet UIButton *botonMensajePersona2;
@property (weak, nonatomic) IBOutlet UIButton *botonMensajePersona3;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSaludHgo;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSecretaria;
@property (weak, nonatomic) IBOutlet UIButton *ButtonOrganigrama;

@property (weak, nonatomic) IBOutlet UILabel *titleRedes;

@end
