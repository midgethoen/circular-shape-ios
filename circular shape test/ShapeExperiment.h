//
//  ShapeExperiment.h
//  circular shape test
//
//  Created by Midge 't Hoen on 23-02-13.
//  Copyright 2013 Midge 't Hoen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import <GLKit/GLKit.h>
#import "math.h"


#define RADIUS          100    //pixles
#define PRECISION       72      //avg vert length pixels
#define SPEED           3      //px/

#define RAD_STEP        2*M_PI/PRECISION

#define COLOR_R         100
#define COLOR_G         100
#define COLOR_B         100
#define COLOR_A         255

@interface ShapeExperiment : CCNode <CCTargetedTouchDelegate>{
@protected
    float speed;
    CCTexture2D *tex;
    
    float rib[PRECISION];
    float glPoints[PRECISION*2];
    GLubyte color[2];

}

@end
