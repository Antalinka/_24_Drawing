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
    
    UITapGestureRecognizer* tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self
                                           action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UITapGestureRecognizer* doubleTapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self
                                           action:@selector(doubleHandleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                               duration:(NSTimeInterval)duration{
    
     [self.drawingView setNeedsDisplay];
    
}
-(void)handleTap:(UIGestureRecognizer*) tapGesture{
    
    NSLog(@"tap Gesture");
    self.drawingView.canvas.image = nil;
    self.drawingView.userInteractionEnabled = NO;
    [self.drawingView drawStarWithRect];


}

-(void)doubleHandleTap:(UIGestureRecognizer*) doubleGesture{
    
    NSLog(@"double tap Gesture");
    self.drawingView.canvas.image = nil;
    
}

@end
