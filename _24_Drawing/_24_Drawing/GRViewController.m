//
//  GRViewController.m
//  _24_Drawing
//
//  Created by Exo-terminal on 5/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"
#import "GRDrawingView.h"

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer* tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self
                                           action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UITapGestureRecognizer* doubleTapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self
                                           action:@selector(doubleHandleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
    [self.drawingView setNeedsDisplay];
    
//    CGRect rect = [[UIScreen mainScreen] applicationFrame];
//    [self.drawingView myDrawRectWithRect:rect];
    
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                               duration:(NSTimeInterval)duration{
    
    [self.drawingView setNeedsDisplay];
    
}
-(void)handleTap:(UIGestureRecognizer*) tapGesture{
    
    [self.drawingView setNeedsDisplay];

}

-(void)doubleHandleTap:(UIGestureRecognizer*) doubleGesture{
    
    self.drawingView.canvas.image = nil;
    
}

@end
