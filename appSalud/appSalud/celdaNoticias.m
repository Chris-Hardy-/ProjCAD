//
//  celdaNoticias.m
//  appSalud
//
//  Created by Dulce Beatriz Godinez Guerrero on 06/09/14.
//  Copyright (c) 2014 Christopher Hardy & Dulce Beatriz. All rights reserved.
//

#import "celdaNoticias.h"


@implementation celdaNoticias

@synthesize labelNotica=_labelNotica;
@synthesize imagenNoticia=_imagenNoticia;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
