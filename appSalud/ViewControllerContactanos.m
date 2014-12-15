//
//  ViewControllerContactanos.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 26/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerContactanos.h"
#import "SWRevealViewController.h"

@interface ViewControllerContactanos ()

@end

@implementation ViewControllerContactanos

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
    
    UIImage *menu = [UIImage imageNamed:@"menu.png"];
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithImage:menu style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    self.title = @"Contactanos";
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];//despliega a menu principal
    

    self.scrollViewContenido.scrollEnabled = true;
    self.scrollViewContenido.contentSize = self.scrollViewContenido.frame.size;
    self.scrollViewContenido.frame = self.view.frame;
    
    self.textFieldQueja.delegate = self;
    self.editCorreoElectronico.delegate = self;
    self.editNombre.delegate = self;
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
- (IBAction)botonEnviarQueja:(id)sender {
    
    if ([self.editNombre.text isEqualToString:@""] || [self.editCorreoElectronico.text isEqualToString:@""] || [self.textFieldQueja.text isEqualToString:@""] || [self.textFieldQueja.text isEqualToString:@"Escribe aqui tu sugerencia o tu queja."]) {
        UIAlertView *message;
        message = [[UIAlertView alloc] initWithTitle:@"Error"
                                             message:@"Debes de llenar todos los campos"
                                            delegate:self
                                   cancelButtonTitle:@"Ok"
                                   otherButtonTitles:nil];
        [message show];
    }
    else
    {
        NSString *emailTitle = [NSString stringWithFormat:@"Queja o sugerencia de: %@", self.editNombre.text];
        NSString *messageBody = [NSString stringWithFormat:@"Nombre: %@ \n\nQueja o Suggerencia: %@\n\nEmail de contacto: %@", self.editNombre.text, self.textFieldQueja.text, self.editCorreoElectronico.text];
        NSArray *toRecipents = [NSArray arrayWithObject:@"hardy.chris.91@icloud.com"];
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];        
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
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

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    self.scrollViewContenido.contentOffset = CGPointMake(0,50);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        self.scrollViewContenido.contentOffset = CGPointMake(0,-50);
        return NO;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
