//
//  GRDrawingView.m
//  _24_Drawing
//
//  Created by Exo-terminal on 5/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRDrawingView.h"
#define count 5


@interface GRDrawingView ()

@property (assign, nonatomic)CGContextRef context;
@property (strong, nonatomic) NSMutableArray* array;

@property (assign, nonatomic)CGPoint startPoint;
@property (assign, nonatomic)float sizeStar;
@property (assign, nonatomic)CGRect rect;
@property (strong, nonatomic)NSMutableArray* centerAllStars;

@end


@implementation GRDrawingView

-(void)drawRect:(CGRect)rect

{
    self.centerAllStars = [[NSMutableArray alloc]init];
    self.sizeStar = 100.0f;
    
    int a = 0;
    BOOL deleteFromArray = NO;
    
    while (a < 5) {
        
        CGPoint point = [self randomPointWithRect:rect];
        
        if ([self.centerAllStars count] >= 1) {
            
            
            for (NSValue *value in self.centerAllStars) {
                
                deleteFromArray = YES;
                CGPoint point1 = [value CGPointValue];
                
                if ((point.x > (point1.x - self.sizeStar/2) && point.x < (point1.x + self.sizeStar/2)) ||
                    (point.y > (point1.y - self.sizeStar/2) && point.y <  (point1.y + self.sizeStar/2))) {
                    
                    deleteFromArray = NO;
                    break;
                }
                
            }
            
            
            if (deleteFromArray) {
                [self.centerAllStars addObject:[NSValue valueWithCGPoint:point]];
                a ++;
            }
            
        }else{
            [self.centerAllStars addObject:[NSValue valueWithCGPoint:point]];
            a ++;
            
            
        }
}
    
    for (NSValue *value in self.centerAllStars) {
        
//        NSTimeInterval interval = 2.f;
//        [NSThread sleepForTimeInterval:interval];

        CGPoint point2 = [value CGPointValue];

         [self orderCallMethodsWithRect:rect andPoint:point2];
        

    }
}

-(void)drawStarWithRect: (CGRect)rect {
    
}


#pragma mark - Secondary -



-(void) orderCallMethodsWithRect: (CGRect) rect andPoint: (CGPoint)point{
    
    self.array = [[NSMutableArray alloc]init];
    
    

    [self drawStarsWithCoordinate: point];
    
    [ self.array sortUsingComparator:^NSComparisonResult(NSValue* obj1, NSValue* obj2) {
        
        CGPoint point1 = [obj1 CGPointValue];
        CGPoint point2 = [obj2 CGPointValue];
        float x1 = point1.x;
        
        float x2 = point2.x;
        
        if (x1 > x2) {
            return NSOrderedDescending;
        } else if(x1 < x2){
            return NSOrderedAscending;
        }
        
        return NSOrderedSame;
    }];
    
    [self drawLine];
    [self drawRect];
    
}


-(float)randomFloat{
    
    float a = arc4random()%100;
    a = a/100;
    
    return a;
}


-(CGPoint)randomPointWithRect: (CGRect)rect{
    
  
    int x = arc4random()%(int)(CGRectGetWidth(rect) - self.sizeStar);
    
    int y =  arc4random()%(int)(CGRectGetHeight(rect)- self.sizeStar);
    
    CGPoint point = CGPointMake(x + self.sizeStar/2, y +  self.sizeStar/2);
    
//   [self.centerAllStars addObject:[NSValue valueWithCGPoint:point]];


    return point;
}

#pragma mark - Drawing -

-(void) drawStarsWithCoordinate: (CGPoint)point{
    
    float color[4] = { [self randomFloat], [self randomFloat], [self randomFloat], 1.0 };
    
    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGFloat xCenter = point.x;
    
    CGFloat yCenter = point.y;
    
    
    float  w = self.sizeStar;
    
    double r = w / 2.0;
    
    float flip = -1.0;
    
    
    for (NSUInteger i=0; i<1; i++)
        
    {
        CGContextSetFillColorWithColor(context, aColor);
        
        CGContextSetStrokeColorWithColor(context, aColor);
        
        double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
        
        CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
        
        
        self.startPoint = CGPointMake(xCenter, r*flip + yCenter);
        
        
        [self.array addObject:[NSValue valueWithCGPoint:self.startPoint]];
        
        for (NSUInteger k=1; k<5; k++)
            
        {
            float x = r * sin(k * theta);
            
            float y = r * cos(k * theta);
            
            CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
            
            CGPoint point1 = CGPointMake( x+xCenter, y*flip+yCenter);
            
            [self.array addObject:[NSValue valueWithCGPoint:point1]];
            
        }
        
        xCenter += 150.0;
        
    }
    
    CGContextClosePath(context);
    
    CGContextFillPath(context);
   
}


-(void) drawRect{
    
    for (NSValue *value in self.array) {
        
            CGContextRef context = UIGraphicsGetCurrentContext();
        
            CGPoint point = [value CGPointValue];
            
            CGRect rect = CGRectMake(point.x - 5, point.y - 5, 10, 10);
            
            CGContextAddEllipseInRect(context, rect);
            
            [[UIColor purpleColor]setFill];
        
            CGContextClosePath(context);
            CGContextFillPath(context);
    }
    
 }

-(void) drawLine{
    
        CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGPoint point1 = [[self.array objectAtIndex:0] CGPointValue];
    
    CGContextMoveToPoint(context, self.startPoint.x, self.startPoint.y);

    
    for (NSValue *value in self.array) {
        
            CGPoint point = [value CGPointValue];
            
            if (point.x != self.startPoint.x && point.y != self.startPoint.y) {
                CGContextRef context = UIGraphicsGetCurrentContext();
                
                CGContextAddLineToPoint(context, point.x, point.y );
                
                CGContextSetLineWidth(context, 1.f);
                
                [[UIColor blackColor]setStroke];
                
 
            }
            
            
    }
    CGContextClosePath(context);
    CGContextStrokePath(context);
}




@end
