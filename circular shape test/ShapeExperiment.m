//
//  ShapeExperiment.m
//  circular shape test
//
//  Created by Midge 't Hoen on 23-02-13.
//  Copyright 2013 Midge 't Hoen. All rights reserved.
//

#import "ShapeExperiment.h"
#import "ccTypes.h"

//#import "Platforms/CCGL.h"
#import "ccGLStateCache.h"
#import "CCShaderCache.h"
#import "CCGLProgram.h"
#import "CCActionCatmullRom.h"
//#import "Support/OpenGL_Internal.h"


@implementation ShapeExperiment

-(id) init
{
	if( (self=[super init]) ) {
        [self construct];
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:NO];
        [self scheduleUpdate];
        UIImage *img = [UIImage imageNamed:@"amoeba.png"];
        
        tex = [[[CCTexture2D alloc] initWithCGImage:[img CGImage] resolutionType:kCCResolutioniPad] retain];
	}
	return self;
}


static CGPoint normals[PRECISION];
    

-(void)construct{
    for (int i = 0; i < PRECISION; i++) {
        rib[i] = RADIUS;
        
        normals[i] = ccp(cosf(i*RAD_STEP), sinf(RAD_STEP*i));
        
    }
    speed = SPEED;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    speed = 4*SPEED;
    return YES;
}

-(void)update:(ccTime)delta{
    
    speed -= (speed - SPEED)/100;
    
    static float startA = 0;
    static float startB = 66;
    
    startA += delta * speed;
    startB -= delta * speed/2;
    
    //recalculate ribs
    for (int i = 0; i < PRECISION; i++) {
        rib[i] = RADIUS
            + RADIUS*0.02f*cosf( startB + i * (M_PI*2)/PRECISION*4 )
            + RADIUS*0.05f*cosf( startA + i * (M_PI*2)/PRECISION*3 )
            + RADIUS*0.05f*cosf( -startA + i * (M_PI*2)/PRECISION*2 );
    }
    
    
    //apply ribs
    for (int i = 0; i < PRECISION; i++) {
        CGPoint p = ccpMult(normals[i], rib[i]);
        glPoints[2*i]   = p.x;
        glPoints[2*i+1] = p.y;
    }
}


-(void)draw{
//    glBindTexture(GL_TEXTURE_2D, tex.name);
//	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_DECAL);
//	glVertexPointer(2, GL_FLOAT, 0, glPoints);
//	glTexCoordPointer(2, GL_FLOAT, 0, glPoints);
//    
//	glDrawArrays(GL_TRIANGLES, 0, PRECISION);
//	glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
//    
//	glEnableClientState(GL_COLOR_ARRAY);
//    static ccColor4F color = ccColor4F();
    
    ccDrawSolidPoly(glPoints, PRECISION, (ccColor4F) {1.0,1.0,1.0,0.01});
    
}

@end
