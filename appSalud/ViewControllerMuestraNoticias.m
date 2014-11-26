//
//  ViewControllerMuestraNoticias.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 06/09/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerMuestraNoticias.h"
#import "noticia.h" //3 Importo el .h para sacra lo del xml


@interface ViewControllerMuestraNoticias (){
    NSUserDefaults *userDefaults; // 1 Primero declaro el objeto
    noticia *auxNoticia; //6 declaro un auxiliar para pasar el arreglo a string
}

@end

@implementation ViewControllerMuestraNoticias

@synthesize textFieldCuerpoNoticia=_textFieldCuerpoNoticia;// 5 sintetizo al cuerpo
@synthesize arrayNoticia = _arrayNoticia; //9
@synthesize imagenNoticia =_imagenNoticia;
@synthesize tituloNoticia =_tituloNoticia;


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
    
    //change font
    
    [self.tituloNoticia setFont:[UIFont fontWithName:@"Antipasto" size:18.0]];
    [self.textFieldCuerpoNoticia setFont:[UIFont fontWithName:@"Antipasto" size:18.0]];
    self.buttonVerMasNoticia.titleLabel.font = [UIFont fontWithName:@"Antipasto" size:18.0f];
   
    self.title = @"Noticia Individual";
    
    self.textFieldCuerpoNoticia.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
    userDefaults = [NSUserDefaults standardUserDefaults];//2 Usar objeto userDefaul
    auxNoticia = [[noticia alloc] init]; //7 dejo preparado a aux
    self.arrayNoticia = [[NSArray alloc] init];
    
    int indice = [[userDefaults objectForKey:@"indiceMuestraNoticia"] intValue];
    
    NSData *arrayData = [userDefaults objectForKey:@"arrayNoticias"];  // 4 Saco el relleno de arrayNoticias del xml
    self.arrayNoticia =  [NSArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:arrayData]];
    
    auxNoticia = [self.arrayNoticia objectAtIndex:indice]; //10 cambio de formato al array
    
    self.textFieldCuerpoNoticia.text = auxNoticia.textoNoticia;
    self.tituloNoticia.text = auxNoticia.tituloNoticia;

    
    self.imagenNoticia.image = [self imageWithImage: [UIImage imageWithData:auxNoticia.imagenNoticia]scaledToSize:CGSizeMake(135,135)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTexture.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)abrePublicidadNavegador:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:auxNoticia.urlNoticia]];
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

@end
