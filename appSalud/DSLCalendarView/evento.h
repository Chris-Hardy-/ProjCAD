//
//  evento.h
//  appSalud
//
//  Created by Christopher Hardy on 12/15/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface evento : NSObject <NSCoding>

@property (nonatomic, copy) NSString *titulo;
@property (nonatomic, copy) NSString *descripcion;
@property (nonatomic, assign) NSDate *fecha;

@end
