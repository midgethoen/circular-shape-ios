//
//  HelloWorldLayer.m
//  circular shape test
//
//  Created by Midge 't Hoen on 23-02-13.
//  Copyright Midge 't Hoen 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

#import "ShapeExperiment.h"


// Needed to obtain the Navigation Controller
#import "AppDelegate.h"


#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
    [scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
        CGSize winsize = [[CCDirector sharedDirector] winSize];
        ShapeExperiment *se = [ShapeExperiment node];
        se.position = ccp(winsize.height/2, winsize.width/2);
        
        [self addChild:se];
	}
	return self;
}

@end
