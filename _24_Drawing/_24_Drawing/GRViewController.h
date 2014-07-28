//
//  GRViewController.h
//  _24_Drawing
//
//  Created by Exo-terminal on 5/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GRDrawingView;

@interface GRViewController : UIViewController

@property (weak, nonatomic) IBOutlet GRDrawingView *drawingView;
//@property (strong, nonatomic) IBOutlet GRDrawingView* drawingView;

@end
