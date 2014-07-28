//
//  GRDrawingView.m
//  _24_DrawingsTest
//
//  Created by Exo-terminal on 5/2/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRDrawingView.h"

@implementation GRDrawingView



- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect %@",NSStringFromCGRect(rect));
    
   CGContextRef myContext = UIGraphicsGetCurrentContext();
    CGFloat wd = 900.0f;
    CGFloat ht = 900.0f;
    
    MyDrawTransparencyLayer(myContext, wd, ht);
    
     /*CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGRect square1 =  CGRectMake(100, 100, 100, 100);
    CGRect square2 =  CGRectMake(200, 200, 100, 100);
    CGRect square3 =  CGRectMake(300, 300, 100, 100);

    
    CGContextAddRect(context,square1);
    CGContextAddRect(context,square2);
    CGContextAddRect(context,square3);
    
//    CGContextFillPath(context);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    
    CGContextAddEllipseInRect(context,square1);
    CGContextAddEllipseInRect(context,square2);
    CGContextAddEllipseInRect(context,square3);
    
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextSetLineWidth(context, 1.f);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddLineToPoint(context, CGRectGetMinX(square3), CGRectGetMaxY(square3));
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    CGContextAddLineToPoint(context, CGRectGetMaxX(square1), CGRectGetMinY(square1));
    
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddArc(context,  CGRectGetMaxX(square1), CGRectGetMaxY(square1), CGRectGetWidth(square1),M_PI, 0,YES);
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    CGContextAddArc(context,  CGRectGetMinX(square3), CGRectGetMinY(square3), CGRectGetWidth(square1),0,M_PI,YES);
    
    CGContextStrokePath(context);
    
    NSString* string = @"text";
    UIFont* font = [UIFont systemFontOfSize:14.f];
    NSShadow* shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowBlurRadius = 0.5f;
    shadow.shadowOffset = CGSizeMake(1, 1);
    
    
    NSDictionary* attributes =
    [[NSDictionary alloc]initWithObjectsAndKeys:
     [UIColor redColor],NSForegroundColorAttributeName,
     font, NSFontAttributeName,
     shadow,NSShadowAttributeName,nil];
    
    CGSize sizeText = [string sizeWithAttributes:attributes];
    
    CGRect textRect = CGRectMake(CGRectGetMidX(square2) - sizeText.width/2,
                                 CGRectGetMidY(square2) - sizeText.height/2,
                                 sizeText.width,sizeText.height);
    textRect = CGRectIntegral(textRect);
    
    [string drawInRect:textRect withAttributes:attributes];
//    [string drawAtPoint:CGPointMake(CGRectGetMidX(square2) - sizeText.width/2, CGRectGetMidY(square2) - sizeText.height/2) withAttributes:attributes];
    
    
//  CGContextAddRect(context, CGRectMake(100, 100, 100, 100));
    
    CGContextAddRect(context, rect);
    CGContextFillPath(context);
    
    CGContextFillRect(context, rect);*/
    /*
    CGFloat offset = 50.f;
    CGFloat borderWidth = 4.f;
    
    CGFloat maxBoadSize = MIN(CGRectGetWidth(rect) - offset * 2  - borderWidth * 2,
                              CGRectGetHeight(rect) - offset * 2  - borderWidth * 2);
    int cellSize = (int)maxBoadSize / 8;
    int boadSize = cellSize * 8;
    CGRect boadRect = CGRectMake((CGRectGetWidth(rect) - boadSize)/ 2,
                                 (CGRectGetHeight(rect) - boadSize) / 2,
                                 boadSize, boadSize);
    boadRect = CGRectIntegral(boadRect);
    
    for (int i = 0; i < 8; i++ ) {
        for (int j = 0; j < 8; j++ ) {
            
            if (i % 2 != j % 2) {
                CGRect cellRect = CGRectMake(CGRectGetMinX(boadRect) + i * cellSize,
                                             CGRectGetMinY(boadRect) + j * cellSize,
                                             cellSize, cellSize);
                CGContextAddRect(context, cellRect);
            }
        }
    }
    
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextAddRect(context, boadRect);
    
    CGContextSetLineWidth(context, borderWidth);
    
    CGContextStrokePath(context);

    
    */
    
    [self generateBlendingImagesWithColor1:[UIColor greenColor] andColor2:[UIColor purpleColor]];
    
}

void MyDrawTransparencyLayer (CGContextRef myContext,
                              CGFloat wd,
                              CGFloat ht)
{
    
    CGSize myShadowOffset = CGSizeMake(10, -20);
    
    CGContextSetShadow(myContext, myShadowOffset, 20);
    CGContextBeginTransparencyLayer(myContext, NULL);
    
    CGContextSetRGBFillColor(myContext, 0, 1, 0, 1);
    CGContextFillRect(myContext, CGRectMake(wd/3 + 50, ht/2, wd/4, ht/4));
    
    CGContextSetRGBFillColor(myContext, 0, 0, 1, 1);
    CGContextFillRect(myContext, CGRectMake(wd/3 - 50, ht/2 - 100, wd/4, ht/4));
    
    CGContextSetRGBFillColor(myContext, 1, 0, 0, 1);
    CGContextFillRect(myContext, CGRectMake(wd/3, ht/2 - 50, wd/4, ht/4));
    
    CGContextEndTransparencyLayer(myContext);
    
}

- (void) generateBlendingImagesWithColor1: (UIColor*)color1 andColor2:(UIColor*)color2
{
    NSArray *names = @[@"kCGBlendModeNormal", @"kCGBlendModeMultiply", @"kCGBlendModeScreen", @"kCGBlendModeOverlay", @"kCGBlendModeDarken", @"kCGBlendModeLighten", @"kCGBlendModeColorDodge", @"kCGBlendModeColorBurn", @"kCGBlendModeSoftLight", @"kCGBlendModeHardLight", @"kCGBlendModeDifference", @"kCGBlendModeExclusion", @"kCGBlendModeHue", @"kCGBlendModeSaturation", @"kCGBlendModeColor", @"kCGBlendModeLuminosity", @"kCGBlendModeClear", @"kCGBlendModeCopy", @"kCGBlendModeSourceIn", @"kCGBlendModeSourceOut", @"kCGBlendModeSourceAtop", @"kCGBlendModeDestinationOver", @"kCGBlendModeDestinationIn", @"kCGBlendModeDestinationOut", @"kCGBlendModeDestinationAtop", @"kCGBlendModeXOR", @"kCGBlendModePlusDarker", @"kCGBlendModePlusLighter"];
    
    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIBezierPath *shape1 = [UIBezierPath bezierPathWithOvalInRect:rect];
    rect.origin.x += 50;
    UIBezierPath *shape2 = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    for (int i = kCGBlendModeNormal; i <= kCGBlendModePlusLighter; i++)
    {
        NSString *name = [names[i - kCGBlendModeNormal] stringByAppendingPathExtension:@"png"];
        UIGraphicsBeginImageContext(CGSizeMake(150, 100));
        
//        UIColor *greenColor = [[UIColor greenColor]setFill];
        [color1 set];
        [shape1 fill];
        
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), i);
        
        [color2 set];
        [shape2 fill];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        NSData *data = UIImagePNGRepresentation(image);
//        [data writeToFile:DOCS_PATH(name) atomically:YES];
        
        UIGraphicsEndImageContext();
        
    }
}

@end
