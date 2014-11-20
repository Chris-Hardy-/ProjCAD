//
//  ViewControllerMuestraNoticias.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 06/09/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerMuestraNoticias : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagenNoticia;
@property (weak, nonatomic) IBOutlet UILabel *tituloNoticia;
@property (weak, nonatomic) IBOutlet UITextView *textFieldCuerpoNoticia;


@property (nonatomic) NSArray *arrayNoticia; //8 declaro global


@end
