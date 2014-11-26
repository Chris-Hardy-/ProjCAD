//
//  ViewControllerVacantes.h
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 26/11/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerVacantes : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    //    IBOutlet UITableView *TablaVacantes;
    NSArray *tableData;
    
}
@property (weak, nonatomic) IBOutlet UITableView *TablaVacantes;
@property (weak, nonatomic) IBOutlet UITextField *editBoton;



@end
