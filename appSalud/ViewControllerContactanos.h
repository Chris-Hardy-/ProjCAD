//
//  ViewControllerContactanos.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 26/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewControllerContactanos : UIViewController<UITextViewDelegate, MFMailComposeViewControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *editNombre;
@property (weak, nonatomic) IBOutlet UITextField *editCorreoElectronico;
@property (weak, nonatomic) IBOutlet UITextView *textFieldQueja;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContenido;

@end
