//
//  MainViewController.m
//  appSalud
//
//  Created by Christopher Hardy on 8/19/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "mensaje.h"

@interface MainViewController ()

@end

@implementation MainViewController{
    NSMutableArray *arrayMensajes;
    NSUserDefaults *userDefaults;
    
}

@synthesize botonMensajePersona1=_botonMensajePersona1;
@synthesize botonMensajePersona2=_botonMensajePersona2;
@synthesize botonMensajePersona3=_botonMensajePersona3;

- (void)viewDidLoad
{
    [super viewDidLoad];
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.title = @"Acerca de Nosotros";
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayMensajes"];
    arrayMensajes = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    //button.titleLabel.font = [UIFont systemFontOfSize:size];
    
    self.ButtonSaludHgo.titleLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
    self.ButtonSecretaria.titleLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
    self.ButtonOrganigrama.titleLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
    self.titleRedes.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
    self.titleMensajes.font = [UIFont fontWithName:@"Antipasto" size:18.0f];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    mensaje *mensajeTemp;
    mensajeTemp = [arrayMensajes objectAtIndex:0];
    UIImage *imagenPerfil = [self imageWithImage:[UIImage imageWithData:mensajeTemp.imagenPerfil] scaledToSize:CGSizeMake(60, 60)];
    [self.botonMensajePersona1 setBackgroundImage:imagenPerfil forState:UIControlStateNormal];
    self.botonMensajePersona1.imageView.image = imagenPerfil;
    
    mensajeTemp = [arrayMensajes objectAtIndex:1];
    imagenPerfil = [self imageWithImage:[UIImage imageWithData:mensajeTemp.imagenPerfil] scaledToSize:CGSizeMake(60, 60)];
    [self.botonMensajePersona2 setBackgroundImage:imagenPerfil forState:UIControlStateNormal];
    self.botonMensajePersona2.imageView.image = imagenPerfil;
    
    mensajeTemp = [arrayMensajes objectAtIndex:2];
    imagenPerfil = [self imageWithImage:[UIImage imageWithData:mensajeTemp.imagenPerfil] scaledToSize:CGSizeMake(60, 60)];
    [self.botonMensajePersona3 setBackgroundImage:imagenPerfil forState:UIControlStateNormal];
    self.botonMensajePersona3.imageView.image = imagenPerfil;
}
- (IBAction)botonPersona1:(id)sender {
    userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"persona1" forKey:@"mensajeDesplegar"];
    
}
- (IBAction)botonPersona2:(id)sender {
    userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"persona2" forKey:@"mensajeDesplegar"];
}
- (IBAction)botonPersona3:(id)sender {
    userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"persona3" forKey:@"mensajeDesplegar"];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (IBAction)botonMandarEmail:(id)sender {
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setSubject:@""];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"subdireccion.informacion@hidalgo.gob.mx"]];
        [mailCont setMessageBody:@"In Lorem Ipsum" isHTML:NO];
        
        [self presentViewController:mailCont animated:YES completion:nil];
        //[mailCont release];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    //handle any error
    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)botonFaceBook:(id)sender {
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]]) {
        // Safe to launch the facebook app
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/122952944445704"]];
    }
    else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/secretariadesaludhidalgo"]];
    }
}
- (IBAction)botonTwitter:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]) {
        // Safe to launch the twitter app
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?id=278219783"]];
    }
    else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/search?q=%40Salud_Hidalgo&src=typd"]];
    }
}
- (IBAction)botonGooglePlus:(id)sender {
}

- (IBAction)botonSecretariaSalud:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://s-salud.hidalgo.gob.mx"]];
    
}
- (IBAction)botonSaludHidalgo:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://148.223.236.39/ssh-wp/"]];
    
    
}


@end
