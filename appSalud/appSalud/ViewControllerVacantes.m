//
//  ViewControllerVacantes.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 26/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "ViewControllerVacantes.h"

@interface ViewControllerVacantes ()

@end

@implementation ViewControllerVacantes{
    
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
    // Do any additional setup after loading the view.
    
     tableData = [[NSArray alloc] init];
    
    self.TablaVacantes.hidden = true;  //Se oculta la tabla al principio (es el box que guarda abajo del boton)

    
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
//    
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (tableView == self.TablaNoticias) {
//        tableData = arrayNoticias;
//        return  [arrayNoticias count];
//    }
//    else if (tableView == self.TablaIndices){
//        tableData = arrayIndices;
//        return  [arrayIndices count];
//    }
//    
//    return 0;
//    
//    //Funcion para ocultar la tableviewIndices dando click en la pantalla
//}




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

@end
