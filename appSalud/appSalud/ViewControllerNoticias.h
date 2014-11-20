//
//  ViewControllerNoticias.h
//  appSalud
//
//  Created by Christopher Hardy on 8/28/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerNoticias : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    //    IBOutlet UITableView *TablaIndices;
    NSArray *tableData;
    //    IBOutlet UITableView *TablaNoticias;
}
@property (weak, nonatomic) IBOutlet UITableView *TablaNoticias;
@property (weak, nonatomic) IBOutlet UITableView *TablaIndices;
@property (weak, nonatomic) IBOutlet UITextField *editBoton;


@end
